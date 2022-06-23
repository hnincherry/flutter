import 'dart:developer';

import 'package:foody_girl/model/food_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService _instance =
      DatabaseService._privateConstructor();

  factory DatabaseService() {
    return _instance;
  }

  final String _databaseName = "foody.db";
  final String _tableName = "foodTable";
  final int _databaseVersion = 1;
  String id_column = "id";
  String name_column = "foodName";
  String category_column = "category";
  String qty_column = "qty";

  Database? _database;

  Future<Database> get database async {
    return _database ??= await initializeDatabase();
  }

  Future<Database> initializeDatabase() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, _databaseName);
    var createDatbase =
        openDatabase(path, version: _databaseVersion, onCreate: _oncreate);

    return createDatbase;
  }

  Future<void> _oncreate(Database db, int version) async {
    String createFoodTable =
        "CREATE TABLE $_tableName ($id_column INTEGER PRIMARY KEY AUTOINCREMENT,$name_column TEXT,$category_column TEXT,$qty_column INTEGER)";

    db.execute(createFoodTable);
  }

  Future<int> insertData(FoodModel model) async {
    var databseClient = await database;

    int insertResult = await databseClient.insert(_tableName, model.toMap());
    return insertResult;
  }

  Future<List<Map<String, Object?>>> selectData() async {
    var databaseClient = await database;

    String selectQuery = "SELECT * FROM $_tableName";

    var selectResult = databaseClient.rawQuery(selectQuery);
    return selectResult;
  }

  Future<List<Map<String, Object?>>> updateData(FoodModel model) async {
    var databaseClient = await database;

    String updateQuery =
        "UPDATE $_tableName SET $name_column='${model.foodName}', $category_column='${model.category}', $qty_column=${model.qty} WHERE $id_column=${model.id}";

    var updateResult = databaseClient.rawQuery(updateQuery);
    log('updateResult => $updateResult');
    return updateResult;
  }

  Future<List<Map<String, Object?>>> deleteData(FoodModel model) async {
    var databaseClient = await database;

    String deleteQuery = "DELETE FROM $_tableName WHERE $id_column=${model.id}";
    var deleteResult = databaseClient.rawQuery(deleteQuery);
    return deleteResult;
  }
}
