import 'package:flutter/material.dart';
import 'package:journal_filter/constants/data.dart';
import 'package:journal_filter/models/book.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:journal_filter/constants/size.dart';
import 'package:ionicons/ionicons.dart';

class BookScreen extends StatefulWidget {
  static const routeName = 'screens/book';

  BookScreen({Key key}) : super(key: key);
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Book bookData;
  bool favorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bookData = ModalRoute.of(context).settings.arguments;
    print(bookData.contents);
  }

  List<Widget> getButtons() {
    return [
      TextButton(
          child:
              Text('PDF', style: TextStyle(color: Colors.white, fontSize: 16)),
          onPressed: () async {
            String url = bookData.link['pdf'];
            print(url);

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
            String url = bookData.link['pub'];
            print(url);

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
            String url = bookData.link['doi'];
            print(url);

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
                bookData.link['mainlink']);*/
            String url = Uri.encodeFull('https://wa.me/?text=' +
                'I found this interesting paper on JournalFilter: ' +
                bookData.link['mainlink']);
            print(url);

            if (await canLaunch(url)) {
              await launch(url);
            } else {
              //throw "Could not launch $url";
            }
          }),
      IconButton(
          icon: Icon(Ionicons.mail_outline, color: Colors.white),
          onPressed: () async {
            final Email email = Email(
                body: '<br/><br/><br/>' +
                    'I found this interesting paper on JournalFilter.<br/><br/>' +
                    bookData.link['mainlink'] +
                    '<br/><br/>' +
                    bookData.title +
                    '<br/><br/>' +
                    bookData.postman +
                    '<br/><br/>' +
                    bookData.info +
                    '<br/><br/>' +
                    bookData.contents,
                subject: 'Interesting research I found on JournalFilter.',
                recipients: [''],
                cc: [''],
                bcc: [''],
                isHTML: true);
            await FlutterEmailSender.send(email);
          }),
    ];
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
                    this.favorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.white),
                onPressed: () {
                  setState(() {
                    this.favorite = !this.favorite;
                  });
                })
          ])),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                    bookData.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  ),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0)),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  child: Text(bookData.postman),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0)),
              SizedBox(height: 10.0),
              Container(
                  child: Text(bookData.info),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0)),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Html(
                    data: bookData.contents,
                  ))
            ],
          )),
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
