import 'package:flutter/material.dart';
import 'package:journal_filter/constants/size.dart';
import 'package:journal_filter/screens/selection.dart';
import 'package:journal_filter/screens/favorites.dart';
import 'package:journal_filter/screens/contact_us.dart';
import 'package:journal_filter/screens/disclaimer.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'screens/home';

  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selIndex = 0;
  bool showFavo = false;
  final LocalStorage favoStorage = LocalStorage('journal_filter');

  @override
  void initState() {
    super.initState();

    favoStorage.ready.then((value) {
      if (favoStorage.getItem('favorite_books') == null) {
        favoStorage.setItem('favorite_books', []);
      }
    });

    Future.delayed(Duration(milliseconds: 0), () async {
      final status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      print(status.toString());
    });
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
      if (showFavo == false) {
        return SelectionScreen();
      } else {
        return FavoritesScreen();
      }
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
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(defAppBarHeight),
          child: AppBar(
              title: Text(getAppBarTitle()),
              centerTitle: true,
              actions: selIndex == 0
                  ? [
                      /*PopupMenuButton(
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
                        icon: Icon(this.showFavo
                            ? Icons.favorite
                            : Icons.favorite_outline),
                        onPressed: () {
                          setState(() {
                            this.showFavo = !this.showFavo;
                          });
                        },
                      )
                    ]
                  : [])),
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
