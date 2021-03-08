import 'package:flutter/material.dart';
import 'package:journal_filter/constants/data.dart';
import 'package:journal_filter/models/book.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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
  }

  List<Widget> getButtons() {
    return [
      IconButton(
          icon: Icon(Ionicons.ios_mail, color: Colors.white),
          onPressed: () async {
            final Email email = Email(
                body: bookData.contents,
                subject:
                    'I\'d like to share this publication I found on journalfilter with you: link to view the abstract on journalfilter, below that the abstract with same layout as in app (title / authors / text etc)',
                recipients: [''],
                cc: [''],
                bcc: [''],
                isHTML: true);
            await FlutterEmailSender.send(email);
          }),
      IconButton(
          icon: Icon(Ionicons.logo_whatsapp, color: Colors.white),
          onPressed: () async {
            String url = 'whatsapp://send?text=' + bookData.link['mainlink'];
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Book'), actions: [
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
        ]),
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
                  height: 20.0,
                ),
                Container(
                    child: Text(bookData.info),
                    padding: EdgeInsets.only(left: 20.0, right: 20.0)),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Html(
                      data: bookData.contents,
                    ))
              ],
            )),
        floatingActionButton:
            OrientationBuilder(builder: (context, orientation) {
          return FabCircularMenu(
            children: getButtons(),
            alignment: Alignment.bottomLeft,
            ringWidth: 100.0,
            ringDiameter: 500.0,
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
          );
        }));
  }
}
