import 'package:flutter/material.dart';
import 'package:foody_girl/model/food_model.dart';
import 'package:foody_girl/service/database_service.dart';

class FoodController with ChangeNotifier {
  final List<FoodModel> _foodList = [];
  List<FoodModel> get foodList => _foodList;

  // List => [1,2,3]
  // Map => {"key": "value", "key": string/int/double/float/boolean/Object}

  final DatabaseService _databaseService = DatabaseService();

  Future<void> getAllData() async {
    _foodList.clear();
    List rawList = await _databaseService.selectData();

    for (var data in rawList) {
      FoodModel foodData = FoodModel.fromMap(data);
      _foodList.add(foodData);
    }
    notifyListeners();
  }

  Future<int> insertData(String name, String category, int qty) async {
    FoodModel foodData =
        FoodModel(foodName: name, category: category, qty: qty);
    int result = await _databaseService.insertData(foodData);
    return result;
  }

  Future<void> updateData(int id, String name, String category, int qty) async {
    FoodModel foodData =
        FoodModel(id: id, foodName: name, category: category, qty: qty);
    var result = await _databaseService.updateData(foodData);

    getAllData();
  }

  Future<void> deleteData(int id) async {
    FoodModel foodmodel = FoodModel(id: id);
    var result = await _databaseService.deleteData(foodmodel);

    getAllData();
  }
}
