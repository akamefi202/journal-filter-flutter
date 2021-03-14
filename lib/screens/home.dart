import 'package:flutter/material.dart';
import 'package:journal_filter/constants/size.dart';
import 'package:journal_filter/screens/selection.dart';
import 'package:journal_filter/screens/contact_us.dart';
import 'package:journal_filter/screens/disclaimer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'screens/home';

  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  String getAppBarTitle() {
    if (selIndex == 0) {
      return 'Selection';
    } else if (selIndex == 1) {
      return 'Contact Us';
    } else if (selIndex == 2) {
      return 'Disclaimer';
    } else {
      return '';
    }
  }

  Widget getMainScreen() {
    if (selIndex == 0) {
      return SelectionScreen();
    } else if (selIndex == 1) {
      return ContactUsScreen();
    } else if (selIndex == 2) {
      return DisclaimerScreen();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(defAppBarHeight),
          child: AppBar(title: Text(getAppBarTitle()), centerTitle: true)),
      body: getMainScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Contact Us'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Disclaimer')
        ],
        currentIndex: this.selIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            selIndex = index;
          });
        },
      ),
    );
  }
}
