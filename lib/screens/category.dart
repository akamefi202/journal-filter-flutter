import 'package:flutter/material.dart';
import 'package:journal_filter/components/book_item.dart';
import 'package:journal_filter/models/category.dart';
import 'package:journal_filter/models/book.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:http/http.dart' as http;
import 'package:journal_filter/constants/size.dart';
import 'dart:convert';

class CategoryScreen extends StatefulWidget {
  static const routeName = 'screens/category';

  CategoryScreen({Key key}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Category category;
  bool loading = false;
  List<Book> bookList = [];
  String filterValue = 'All';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    category = ModalRoute.of(context).settings.arguments;
    getBooks();
  }

  // get books of category
  Future<void> getBooks() async {
    String url =
        'https://journalfilter.com/Api.php?discipline=cardiology&' + this.category.type + '=' + this.category.url;

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body) as List<dynamic>;
      List<Book> books = [];

      jsonData.forEach((bookData) {
        String contents = bookData['contents'];
        contents = contents.replaceAll('<AbstractText>', '');

        books.add(Book(
            title: bookData['title'],
            postman: bookData['postman'],
            contents: contents,
            info: bookData['info'],
            link: Map<String, String>.from(bookData['link']),
            star: bookData['star'],
            articleId: bookData['article_id'],
            favorite: false));
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
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(defAppBarHeight),
            child: AppBar(
              title: Text(this.category.name),
              actions: [
                DropdownButton(
                    value: this.filterValue,
                    icon: Icon(Icons.filter_outlined, color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        this.filterValue = value;
                      });
                    },
                    items: ['All', 'Favorites', 'Recent'].map((value) {
                      return DropdownMenuItem(child: Text(value), value: value);
                    }).toList())
              ],
              centerTitle: true,
            )),
        body: LoadingOverlay(
            isLoading: this.loading,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Container(child: BookItem(data: this.bookList[i]), padding: EdgeInsets.all(10.0));
                  },
                  itemCount: this.bookList.length),
            )));
  }
}
