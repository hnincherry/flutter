import 'dart:developer';

import 'package:first_pj/model/food_model.dart';
import 'package:first_pj/service/database_service.dart';
import 'package:flutter/cupertino.dart';

class FoodController with ChangeNotifier {
  List<FoodModel> _foodList = [];
  List<FoodModel> get foodList => _foodList;

  final DatabaseService _databaseService = DatabaseService();

  Future<void> getAllData() async {
    _foodList.clear();
    List rawList = await _databaseService
        .selectData(); //// [{'id': 1, 'foodName': 'Apple'},{'id': 2, 'foodName': 'Orange'}]
    // 1. we get raw Map List => rawList

    log("Raw List => $rawList");
    // 2. we need to covert it to FoodModel Object list
    for (var data in rawList) {
      FoodModel foodData = FoodModel.fromMap(data); //3. convert
      _foodList.add(foodData); // 4. add food map onject tp list
    }
    log("Data List => $_foodList");
    notifyListeners();
  }

  Future<int> insertData(String name) async {
    FoodModel food = FoodModel(foodName: name);
    int result = await _databaseService.insertData(food);
    return result;
  }
}
