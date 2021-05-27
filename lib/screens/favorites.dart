import 'dart:io';

import 'package:flutter/material.dart';
import 'package:journal_filter/components/book_item.dart';
import 'package:journal_filter/models/category.dart';
import 'package:journal_filter/models/book.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:http/http.dart' as http;
import 'package:journal_filter/constants/size.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:admob_flutter/admob_flutter.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = 'screens/favorites';

  FavoritesScreen({Key key}) : super(key: key);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool loading = false;
  List<Book> dbBookList = [];
  List<Book> showBookList = [];
  // storage saves favorite value
  final LocalStorage favoStorage = LocalStorage('journal_filter');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getBookList(null);
    setState(() {
      this.showBookList = this.dbBookList;
    });
  }

  updateShowBookList(dynamic value) {
    setState(() {
      this.showBookList =
          this.dbBookList.where((book) => book.favorite == true).toList();
    });
  }

  // get books of category from database
  getBookList(dynamic value) async {
    String ids = '';

    List<dynamic> favoriteBooks = favoStorage.getItem('favorite_books');
    favoriteBooks.forEach((id) async {
      ids += id + ',';
    });

    if (ids == '') {
      ids = '111111111111';
    }

    String url = 'https://journalfilter.com/Api.php?pmid=' + ids;
    print(url);

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body) as List<dynamic>;

      jsonData.forEach((bookData) {
        String contents = bookData['contents'];
        contents = contents.replaceAll('<AbstractText>', '');

        this.dbBookList.add(Book(
            title: bookData['title'],
            postman: bookData['postman'],
            contents: contents,
            info: bookData['info'],
            link: Map<String, String>.from(bookData['link']),
            star: bookData['star'] * 1.0,
            articleId: bookData['article_id'],
            favorite: true));
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
    return Scaffold(
        body: LoadingOverlay(
      isLoading: this.loading,
      child: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (context, i) {
              return Container(
                  child: BookItem(
                      updateBookList: this.updateShowBookList,
                      bookList: this.showBookList,
                      bookIndex: i),
                  padding: EdgeInsets.all(10.0));
            },
            itemCount: this.showBookList.length,
          )),
    ));
  }
}
