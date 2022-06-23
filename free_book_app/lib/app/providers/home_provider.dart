// import http service

// get raw data from http service
// parse to object and return to controller

// data => UI
//   1. http service -> request API
//   2. provider -> [request => object to map] [response => parse raw data to object model data ]
//   3. controller -> set object model data  to observable variable for UI
//   4. view -> Obx(())

import 'dart:convert';
import 'dart:developer';

import 'package:free_book_app/app/models/book_model.dart';
import 'package:free_book_app/services/http_service.dart';

class HomeProvider {
  final httpService = HttpService();

  Future<List<BookModel>> getBookList() async {
    // 1. get response data from http service
    var response = await httpService.get('/new');
    log("Response => ${json.decode(response.body)}");

    // 2. decode data and get book list with key => 'books'
    var data = json.decode(response.body);
    var dataList = data['books'];
    log("Data List => $dataList");

    // declare bookList
    List<BookModel> bookList = [];

    // loop book data list and convert to object model and add to bookList
    dataList.forEach((item) {
      BookModel book = BookModel.fromMap(item);
      bookList.add(book);
    });

    log('bookList => $bookList');

    return bookList;
  }
}
