import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:journal_filter/screens/book.dart';
import 'package:journal_filter/screens/category.dart';
import 'package:journal_filter/screens/contact_us.dart';
import 'package:journal_filter/screens/disclaimer.dart';
import 'package:journal_filter/screens/home.dart';

var routes = <String, WidgetBuilder>{
  BookScreen.routeName: (BuildContext context) => BookScreen(),
  CategoryScreen.routeName: (BuildContext context) => CategoryScreen(),
  ContactUsScreen.routeName: (BuildContext context) => ContactUsScreen(),
  DisclaimerScreen.routeName: (BuildContext context) => DisclaimerScreen(),
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue
          //visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      home: HomeScreen(),
      routes: routes,
    );
  }
}
