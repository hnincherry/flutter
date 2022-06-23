import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:free_book_app/app/controllers/home_controller.dart';
import 'package:free_book_app/app/models/book_model.dart';
import 'package:get/get.dart';

class HomeNavView extends GetView<HomeController> {
  HomeNavView({Key? key}) : super(key: key);

  final List bookName = [
    "Romeo and Juliet",
    "The Adventureness her lock",
    "The wolf and the grips",
    "Romeo and Juliet",
    "The Adventureness her lock",
    "The wolf and the grips"
  ];

  final List category = [
    "Drama",
    "Love",
    "Horror",
    "Short Stories",
    "Science Fiction",
    "Action & Adventure"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Free Book App",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white12,
        ),
        body: ListView(
          children: [
            Obx(() => bookCover(controller.bookList)),
            SizedBox(height: 20),
            bookCategory(),
            SizedBox(height: 20),
            // parse bookList data from controller
            Obx(() => bookDetail(controller.bookList)),
          ],
        ));
  }

  Widget bookCover(List<BookModel> bookList) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              BookModel book = bookList[index];

              // return Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Card(
              //       child: Container(
              //     child: Image.network(
              //       "${book.image}",
              //       height: 200,
              //       width: 150,
              //       fit: BoxFit.fill,
              //     ),
              //     color: Colors.white,
              //     width: 100,
              //   )),
              // );
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: SizedBox(
                        height: 100,
                        child: Image.network("${book.image}", fit: BoxFit.fill),
                      )));
            },
            scrollDirection: Axis.horizontal));
  }

  Widget bookCategory() {
    return SizedBox(
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 20.5),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: category.length,
              itemBuilder: (context, index) {
                String bookCategory = category[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("$bookCategory"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget bookDetail(List<BookModel> bookList) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recently Added",
            style: TextStyle(fontSize: 20.5),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                BookModel book = bookList[index];
                return Row(
                  children: [
                    Card(
                        child: Container(
                      child: Image.network("${book.image}"),
                      color: Colors.white,
                      width: 100,
                      height: 150,
                    )),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${book.title}',
                            //overflow: TextOverflow.ellipsis,
                            //child: SingleChildScrollView(scrollDirection: Axis.horizontal),
                          ),
                          Text('${book.subtitle}',
                              style: TextStyle(color: Colors.blue)),
                          Text(
                            "The center over government",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              //scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
