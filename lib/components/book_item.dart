import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:journal_filter/screens/book.dart';
import 'package:journal_filter/models/book.dart';

class BookItem extends StatelessWidget {
  final Book data;

  BookItem({this.data});

  @override
  Widget build(BuildContext context) {
    final contextData = MediaQuery.of(context);

    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(BookScreen.routeName, arguments: this.data);
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
                                  data.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[900]),
                                ))),
                            data.favorite
                                ? Icon(Icons.favorite, color: Colors.red)
                                : Icon(Icons.favorite, color: Colors.grey),
                          ]),
                      margin: EdgeInsets.only(bottom: 20.0),
                    ),
                    Container(
                        child: Row(children: [
                          Expanded(
                              flex: 7,
                              child: Container(child: Text(data.postman))),
                          RatingBarIndicator(
                              itemBuilder: (context, i) =>
                                  Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                              rating: data.star)
                        ]),
                        margin: EdgeInsets.only(bottom: 10.0)),
                    Container(child: Text(data.info, textAlign: TextAlign.left))
                  ],
                ))));
  }
}
