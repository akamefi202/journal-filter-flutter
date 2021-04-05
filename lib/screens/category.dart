import 'dart:io';

import 'package:flutter/material.dart';
import 'package:journal_filter/components/book_item.dart';
import 'package:journal_filter/models/category.dart';
import 'package:journal_filter/models/book.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:http/http.dart' as http;
import 'package:journal_filter/constants/size.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:journal_filter/constants/size.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = 'screens/category';

  CategoryScreen({Key key}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Category category;
  bool loading = false;
  List<Book> dbBookList = [];
  List<Book> showBookList = [];
  String filterValue = 'All';
  // storage saves favorite value
  final LocalStorage favoStorage = LocalStorage('journal_filter');
  bool showBanner = true;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels == 0) {
        setState(() {
          showBanner = true;
        });
      } else {
        setState(() {
          showBanner = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    category = ModalRoute.of(context).settings.arguments;
    getDbBookList();

    setState(() {
      this.showBookList = dbBookList;
    });

    //Future.delayed(Duration(milliseconds: ))
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        print('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        print('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        print('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        print('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Reward callback fired. Thanks Andrew!'),
                    Text('Type: ${args['type']}'),
                    Text('Amount: ${args['amount']}'),
                  ],
                ),
              ),
              onWillPop: () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                return true;
              },
            );
          },
        );
        break;
      default:
    }
  }

  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-2408260468793531/4021344136';
      // test id
      //return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-2408260468793531/7543347241';
      // test id
      //return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }

  void updateShowBookList(dynamic value) {
    setState(() {
      if (this.filterValue == 'All') {
        this.showBookList = this.dbBookList;
      } else if (this.filterValue == 'Favorites') {
        this.showBookList =
            this.dbBookList.where((book) => book.favorite == true).toList();
      }
    });
  }

  // get books of category from database
  Future<void> getDbBookList() async {
    String url = 'https://journalfilter.com/Api.php?discipline=cardiology&' +
        this.category.type +
        '=' +
        this.category.url;

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body) as List<dynamic>;

      List<dynamic> favoriteBooks = favoStorage.getItem('favorite_books');

      jsonData.forEach((bookData) {
        String contents = bookData['contents'];
        contents = contents.replaceAll('<AbstractText>', '');

        // get favorite and last viewed time from local storage
        bool favorite = false;
        if (favoriteBooks.contains(bookData['article_id']) == true) {
          favorite = true;
        }

        this.dbBookList.add(Book(
            title: bookData['title'],
            postman: bookData['postman'],
            contents: contents,
            info: bookData['info'],
            link: Map<String, String>.from(bookData['link']),
            star: bookData['star'],
            articleId: bookData['article_id'],
            favorite: favorite));
      });
    } catch (error) {
      print(error);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(defAppBarHeight),
            child: AppBar(
              title: Text(this.category.name),
              actions: [
                /*
                PopupMenuButton(
                  itemBuilder: (context) {
                    return ['All', 'Favorites'].map((value) {
                      return PopupMenuItem(value: value, child: Text(value));
                    }).toList();
                  },
                  icon: Icon(Icons.filter_alt_outlined),
                  onSelected: (value) {
                    setState(() {
                      this.filterValue = value;
                    });

                    this.updateShowBookList(null);
                  },
                )
                */
                IconButton(
                    icon: Icon(this.filterValue != 'All'
                        ? Icons.favorite
                        : Icons.favorite_outline),
                    onPressed: () {
                      if (this.filterValue == 'All') {
                        this.filterValue = 'Favorites';
                      } else {
                        this.filterValue = 'All';
                      }

                      setState(() {
                        this.updateShowBookList(null);
                      });
                    })
              ],
              centerTitle: true,
            )),
        body: LoadingOverlay(
          isLoading: this.loading,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                itemBuilder: (context, i) {
                  if (i == 4) {
                    return Column(children: [
                      Container(
                          child: BookItem(
                              updateBookList: this.updateShowBookList,
                              bookList: this.showBookList,
                              bookIndex: i),
                          padding: EdgeInsets.all(10.0)),
                      SizedBox(height: 10.0),
                      this.showBanner == true
                          ? Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: AdmobBanner(
                                adUnitId: getBannerAdUnitId(),
                                adSize: AdmobBannerSize.LEADERBOARD,
                                listener: (AdmobAdEvent event,
                                    Map<String, dynamic> args) {
                                  handleEvent(event, args, 'Banner');
                                },
                                onBannerCreated:
                                    (AdmobBannerController controller) {
                                  // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                                  // Normally you don't need to worry about disposing this yourself, it's handled.
                                  // If you need direct access to dispose, this is your guy!
                                  // controller.dispose();
                                },
                              ),
                            )
                          : Container()
                    ]);
                  } else {
                    return Container(
                        child: BookItem(
                            updateBookList: this.updateShowBookList,
                            bookList: this.showBookList,
                            bookIndex: i),
                        padding: EdgeInsets.all(10.0));
                  }
                },
                itemCount: this.showBookList.length,
                //controller: this.scrollController,
              )),
        ));
  }
}
