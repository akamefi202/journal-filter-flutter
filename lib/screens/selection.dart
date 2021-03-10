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

class SelectionScreen extends StatefulWidget {
  static const routeName = 'screens/selection';

  SelectionScreen({Key key}) : super(key: key);
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<CategoryGroup> categoryGroups = [];
  GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  bool loading = false;

  @override
  void initState() {
    super.initState();

    getCategoryGroups();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return ListTileTheme(
                        dense: true,
                        child: ExpansionTile(
                            initiallyExpanded: true,
                            collapsedBackgroundColor: Colors.blue[300],
                            title: Text(categoryGroups[i].title,
                                style: TextStyle(fontSize: 16.0)),
                            children: <Widget>[
                              Column(
                                  children: buildExpandableContent(
                                      categoryGroups[i].content))
                            ]));
                  },
                  itemCount: categoryGroups.length))),
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
    );
  }
}
