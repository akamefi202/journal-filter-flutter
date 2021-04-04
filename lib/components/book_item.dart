import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:journal_filter/screens/book.dart';
import 'package:journal_filter/models/book.dart';
import 'package:localstorage/localstorage.dart';

class BookItem extends StatefulWidget {
  final Function updateBookList;
  final List<Book> bookList;
  final int bookIndex;

  BookItem({Key key, this.updateBookList, this.bookList, this.bookIndex})
      : super(key: key);
  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  //Book data;
  // storage saves favorite value
  final LocalStorage favoStorage = LocalStorage('journal_filter');

/*
  @override
  void initState() {
    super.initState();

    this.data = widget.bookList[widget.bookIndex];
    print(this.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    this.data = widget.bookList[widget.bookIndex];
  }
  */

  @override
  Widget build(BuildContext context) {
    Book bookData = widget.bookList[widget.bookIndex];

    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(BookScreen.routeName, arguments: {
                'bookList': widget.bookList,
                'bookIndex': widget.bookIndex
              }).then(widget.updateBookList);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ]),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 9,
                                child: Container(
                                    child: Text(
                                  bookData.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[900]),
                                ))),
                            IconButton(
                                icon: bookData.favorite
                                    ? Icon(Icons.favorite, color: Colors.blue)
                                    : Icon(Icons.favorite_outline,
                                        color: Colors.blue),
                                onPressed: () {
                                  setState(() {
                                    bookData.favorite = !bookData.favorite;

                                    // update favorite book list
                                    List<dynamic> favoriteBooks =
                                        favoStorage.getItem('favorite_books');

                                    if (bookData.favorite) {
                                      favoriteBooks.add(bookData.articleId);
                                    } else {
                                      favoriteBooks.remove(bookData.articleId);
                                    }

                                    favoStorage.setItem(
                                        'favorite_books', favoriteBooks);

                                    widget.updateBookList(null);
                                  });
                                }),
                          ]),
                      margin: EdgeInsets.only(bottom: 20.0),
                    ),
                    Container(
                        child: Row(children: [
                          Expanded(
                              flex: 7,
                              child: Container(child: Text(bookData.postman))),
                          RatingBarIndicator(
                              itemBuilder: (context, i) =>
                                  Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                              rating: bookData.star)
                        ]),
                        margin: EdgeInsets.only(bottom: 10.0)),
                    Container(
                        child: Text(bookData.info, textAlign: TextAlign.left))
                  ],
                ))));
  }
}
