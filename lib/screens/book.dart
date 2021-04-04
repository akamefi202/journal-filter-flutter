import 'package:flutter/material.dart';
import 'package:journal_filter/constants/data.dart';
import 'package:journal_filter/models/book.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:journal_filter/constants/size.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localstorage/localstorage.dart';
import 'package:journal_filter/modules/encoding.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_launch/flutter_launch.dart';

class BookScreen extends StatefulWidget {
  static const routeName = 'screens/book';

  BookScreen({Key key}) : super(key: key);
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<Book> books;
  int bookIndex = 0;
  // storage saves favorite value
  final LocalStorage favoStorage = LocalStorage('journal_filter');
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    books = arguments['bookList'];
    bookIndex = arguments['bookIndex'];
    pageController = PageController(initialPage: bookIndex);
  }

  List<Widget> getButtons() {
    return [
      TextButton(
          child:
              Text('PDF', style: TextStyle(color: Colors.white, fontSize: 16)),
          onPressed: () async {
            String url = books[bookIndex].link['pdf'];

            if (await canLaunch(url)) {
              await launch(url);
            } else {
              //throw "Could not launch $url";
            }
          }),
      TextButton(
          child:
              Text('PUB', style: TextStyle(color: Colors.white, fontSize: 16)),
          onPressed: () async {
            String url = books[bookIndex].link['pub'];

            if (await canLaunch(url)) {
              await launch(url);
            } else {
              //throw "Could not launch $url";
            }
          }),
      TextButton(
          child:
              Text('DOI', style: TextStyle(color: Colors.white, fontSize: 16)),
          onPressed: () async {
            String url = books[bookIndex].link['doi'];

            if (await canLaunch(url)) {
              await launch(url);
            } else {
              //throw "Could not launch $url";
            }
          }),
      IconButton(
          icon: Icon(Ionicons.logo_whatsapp, color: Colors.white),
          onPressed: () async {
            /*String url = Uri.encodeFull('https://wa.me/?text=' +
                'I found this interesting paper on JournalFilter: ' +
                books[bookIndex].link['mainlink']);*/
            /*String url = 'whatsapp://send?text=' +
                'I found this interesting paper on JournalFilter: ' +
                books[bookIndex].link['mainlink'];*/

            /*if (await canLaunch(url)) {
              await launch(url);
            } else {
              //throw "Could not launch $url";
            }*/

            /*FlutterOpenWhatsapp.sendSingleMessage(
                "523423423",
                'I found this interesting paper on JournalFilter: ' +
                    books[bookIndex].link['mainlink']);*/
            try {
              await FlutterLaunch.launchWathsApp(
                  phone: '',
                  message: 'I found this interesting paper on JournalFilter: ' +
                      books[bookIndex].link['mainlink']);
            } catch (error) {
              print(error);
            }
          }),
      IconButton(
          icon: Icon(Ionicons.mail_outline, color: Colors.white),
          onPressed: () async {
            final Email email = Email(
                body: '<br/><br/><br/>' +
                    'I found this interesting paper on JournalFilter.<br/><br/>' +
                    books[bookIndex].link['mainlink'] +
                    '<br/><br/>' +
                    books[bookIndex].title +
                    '<br/><br/>' +
                    books[bookIndex].postman +
                    '<br/><br/>' +
                    books[bookIndex].info +
                    '<br/><br/>' +
                    books[bookIndex].contents,
                subject: 'Interesting research I found on JournalFilter.',
                recipients: [''],
                cc: [''],
                bcc: [''],
                isHTML: true);
            await FlutterEmailSender.send(email);
          }),
    ];
  }

  Widget getPageContent(Book book) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
                  book.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[900]),
                ),
                padding: EdgeInsets.only(left: 20.0, right: 20.0)),
            SizedBox(
              height: 10.0,
            ),
            Container(
                child: Text(book.postman,
                    style: TextStyle(fontStyle: FontStyle.italic)),
                padding: EdgeInsets.only(left: 20.0, right: 20.0)),
            SizedBox(height: 10.0),
            Container(
                child: Text(book.info),
                padding: EdgeInsets.only(left: 20.0, right: 20.0)),
            SizedBox(
              height: 10.0,
            ),
            Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Html(
                  data: book.contents,
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(defAppBarHeight),
          child: AppBar(title: Text('Abstract'), centerTitle: true, actions: [
            IconButton(
                icon: Icon(Ionicons.share_outline),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      backgroundColor: Colors.blue,
                      builder: (context) {
                        return Container(
                            /*decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[500],
                                  blurRadius: 3.0,
                                  spreadRadius: 1.0)
                            ], color: Colors.blue),*/
                            padding: EdgeInsets.only(
                                left: 30,
                                right: 30,
                                bottom: 10 +
                                    MediaQuery.of(context).viewPadding.bottom,
                                top: 10),
                            child: Row(
                              children: getButtons(),
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            ));
                      });
                }),
            IconButton(
                icon: Icon(
                    this.books[bookIndex].favorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.white),
                onPressed: () {
                  setState(() {
                    this.books[bookIndex].favorite =
                        !this.books[bookIndex].favorite;
                    Book bookData = this.books[bookIndex];

                    // update favorite book list
                    List<dynamic> favoriteBooks =
                        favoStorage.getItem('favorite_books');

                    if (bookData.favorite) {
                      favoriteBooks.add(bookData.articleId);
                    } else {
                      favoriteBooks.remove(bookData.articleId);
                    }

                    favoStorage.setItem('favorite_books', favoriteBooks);
                  });
                })
          ])),
      body: PageView(
        controller: this.pageController,
        children: this.books.map((book) => getPageContent(book)).toList(),
        onPageChanged: (index) {
          setState(() {
            this.bookIndex = index;
          });
        },
      ),
      /*floatingActionButton:
            OrientationBuilder(builder: (context, orientation) {
          return FabCircularMenu(
            children: getButtons(),
            alignment: Alignment.bottomLeft,
            ringWidth: 100.0,
            ringDiameter: 500.0,
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
          );
        })*/
    );
  }
}
