import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:journal_filter/constants/size.dart';
import 'package:journal_filter/models/category.dart';
import 'package:journal_filter/screens/category.dart';
import 'package:journal_filter/screens/disclaimer.dart';
import 'package:journal_filter/screens/contact_us.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:journal_filter/components/book_item.dart';
import 'package:journal_filter/models/book.dart';
import 'package:localstorage/localstorage.dart';

class SelectionScreen extends StatefulWidget {
  static const routeName = 'screens/selection';

  SelectionScreen({Key key}) : super(key: key);
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<CategoryGroup> categoryGroups = [];
  List<Book> searchBookList = [];
  GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  bool loading = false;
  bool searching = false;
  String searchText = '';
  TextEditingController _textEditingController;
  // storage saves favorite value
  final LocalStorage favoStorage = LocalStorage('journal_filter');

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    getCategoryGroups();
  }

  updateBookList(dynamic value) {
    setState(() {});
  }

  // get category groups(topics & journals)
  Future<void> getCategoryGroups() async {
    String url =
        'https://journalfilter.com/Api.php?discipline=cardiology&getmenu=topics';

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body) as Map<String, dynamic>;

      List<Category> topics = [];
      List<dynamic> topicsData = jsonData['item'][0]['children'];
      topicsData.forEach((topic) {
        topics.add(
            Category(name: topic['name'], url: topic['url'], type: 'topic'));
      });

      List<Category> journals = [];
      List<dynamic> journalsData = jsonData['item'][1]['children'];
      journalsData.forEach((journal) {
        journals.add(Category(
            name: journal['name'], url: journal['url'], type: 'journal'));
      });

      setState(() {
        categoryGroups = [
          CategoryGroup(title: 'Topics', content: topics),
          CategoryGroup(title: 'Journals', content: journals)
        ];
      });
    } catch (error) {
      print(error);
    }

    setState(() {
      loading = false;
    });
  }

  buildExpandableContent(List<Category> categoryList) {
    final contextData = MediaQuery.of(context);
    List<Widget> columnContent = [];

    for (Category category in categoryList)
      columnContent.add(
        ListTile(
          dense: true,
          title: Container(
              child: Row(children: [
            Container(
              child: Icon(Icons.folder, color: Colors.blue[800]),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
            ),
            Container(
                width: contextData.size.width * 0.7,
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 16.0, color: Colors.blue[800]),
                  overflow: TextOverflow.ellipsis,
                ))
          ])),
          onTap: () {
            Navigator.of(context)
                .pushNamed(CategoryScreen.routeName, arguments: category);
          },
        ),
      );

    return columnContent;
  }

  onSearch() async {
    if (this.searchText == "") {
      return;
    }

    this.setState(() {
      this.searching = true;
      this.searchBookList = [];
    });

    String url = 'https://journalfilter.com/Api.php?search=' + this.searchText;
    print(url);

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body) as List<dynamic>;

      List<dynamic> favoriteBooks = favoStorage.getItem('favorite_books');

      print('search items count: ' + jsonData.length.toString());
      jsonData.forEach((bookData) {
        String contents = bookData['contents'];
        contents = contents.replaceAll('<AbstractText>', '');

        bool favorite = false;
        if (favoriteBooks.contains(bookData['article_id']) == true) {
          favorite = true;
        }

        this.searchBookList.add(Book(
            title: bookData['title'],
            postman: bookData['postman'],
            contents: contents,
            info: bookData['info'],
            link: Map<String, String>.from(bookData['link']),
            star: bookData['star'] * 1.0,
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
    final data = MediaQuery.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoadingOverlay(
          isLoading: this.loading,
          child: Theme(
              data: Theme.of(context).copyWith(
                  accentColor: Colors.blue[800],
                  unselectedWidgetColor: Colors.white,
                  primaryColor: Colors.white,
                  textTheme: Theme.of(context)
                      .textTheme
                      .apply(bodyColor: Colors.white)),
              child: Column(children: [
                Container(
                    color: Colors.blue[300],
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          /*boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            spreadRadius: 3,
                            blurRadius: 3.0)
                      ],*/
                          color: Colors.white),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                color: Colors.grey,
                                icon: Icon(Icons.search),
                                onPressed: () async {
                                  await this.onSearch();
                                }),
                            Container(
                                child: TextField(
                                    controller: this._textEditingController,
                                    textInputAction: TextInputAction.search,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (value) {
                                      this.searchText = value;
                                    },
                                    onSubmitted: (value) async {
                                      await this.onSearch();
                                    }),
                                width: data.size.width * 0.65),
                            IconButton(
                                color: Colors.grey,
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    this._textEditingController.clear();
                                    this.searchText = "";
                                    this.searching = false;
                                  });
                                })
                          ]),
                    )),
                this.searching
                    ? Container(
                        height: data.size.height * 0.7,
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ListView.builder(
                          itemBuilder: (context, i) {
                            return Container(
                                child: BookItem(
                                    updateBookList: this.updateBookList,
                                    bookList: this.searchBookList,
                                    bookIndex: i),
                                padding: EdgeInsets.all(10.0));
                          },
                          itemCount: this.searchBookList.length,
                        ))
                    : Container(
                        height: data.size.height * 0.7,
                        child: ListView.builder(
                            itemBuilder: (context, i) {
                              return ListTileTheme(
                                  dense: true,
                                  child: ExpansionTile(
                                      initiallyExpanded: true,
                                      collapsedBackgroundColor:
                                          Colors.blue[300],
                                      title: Text(categoryGroups[i].title,
                                          style: TextStyle(fontSize: 16.0)),
                                      children: <Widget>[
                                        Column(
                                            children: buildExpandableContent(
                                                categoryGroups[i].content))
                                      ]));
                            },
                            itemCount: categoryGroups.length))
              ])),
          /*floatingActionButton: FabCircularMenu(
            key: fabKey,
            children: [
              IconButton(
                  icon: Icon(Icons.description_outlined, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushNamed(DisclaimerScreen.routeName);
                    fabKey.currentState.close();
                  }),
              IconButton(
                  icon: Icon(Icons.email_outlined, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ContactUsScreen.routeName);
                    fabKey.currentState.close();
                  })
            ],
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
            ringWidth: 75.0,
            ringDiameter: 300.0,
          ),*/
        ));
  }
}
