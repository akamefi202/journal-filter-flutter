import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:journal_filter/constants/data.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DisclaimerScreen extends StatefulWidget {
  DisclaimerScreen({Key key}) : super(key: key);
  static const routeName = 'screens/disclaimer';

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Disclaimer')),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Html(
              data: disclaimer,
              onLinkTap: (String url) async {
                print(url);
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  //throw "Could not launch $url";
                }
              },
              style: {'*': Style(fontSize: FontSize(18.0))})),
    );
  }
}
