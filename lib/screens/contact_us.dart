import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:journal_filter/constants/size.dart';
import 'package:localstorage/localstorage.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = 'screens/contact_us';

  ContactUsScreen({Key key}) : super(key: key);
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String subject;
  String note;
  // storage saves favorite value
  final LocalStorage favoStorage = LocalStorage('journal_filter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400], blurRadius: 3.0, spreadRadius: 1.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
              decoration: InputDecoration(
                  hintText: 'Subject',
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none),
              onChanged: (value) {
                this.subject = value;
              }),
          SizedBox(height: 20.0),
          Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter any notes here...',
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  this.note = value;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
              )),
          SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () async {
                //favoStorage.clear();
                //timeStorage.clear();

                final Email email = Email(
                    body: this.note,
                    subject: this.subject,
                    recipients: ['info@stoneripple.com'],
                    cc: [''],
                    bcc: [''],
                    isHTML: false);
                await FlutterEmailSender.send(email);
              },
              child: Text('Send Email')),
        ],
      ),
    ));
  }
}
