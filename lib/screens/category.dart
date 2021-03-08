import 'package:flutter/material.dart';
import 'package:journal_filter/constants/data.dart';
import 'package:journal_filter/components/book_item.dart';
import 'package:journal_filter/models/category.dart';
import 'package:journal_filter/models/book.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key key}) : super(key: key);
  static const routeName = 'screens/category';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Category category;
  bool loading = false;
  List<Book> bookList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    category = ModalRoute.of(context).settings.arguments;
    getBooks();
  }

  // get books of category
  Future<void> getBooks() async {
    String url = 'https://journalfilter.com/Api.php?discipline=cardiology&' +
        this.category.type +
        '=' +
        this.category.url;

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body) as List<dynamic>;
      List<Book> books = [];

      jsonData.forEach((bookData) {
        books.add(Book(
            title: bookData['title'],
            postman: bookData['postman'],
            contents: bookData['contents'],
            info: bookData['info'],
            link: Map<String, String>.from(bookData['link']),
            star: bookData['star'],
            articleId: bookData['article_id']));
      });

      setState(() {
        this.bookList = books;
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
        appBar: AppBar(title: Text(this.category.name)),
        body: LoadingOverlay(
            isLoading: this.loading,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Container(
                        child: BookItem(data: this.bookList[i]),
                        padding: EdgeInsets.all(10.0));
                  },
                  itemCount: this.bookList.length),
            )));
  }
}
