import 'dart:async';
import 'dart:developer';

import 'package:first_pj/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService _instance =
      DatabaseService._privateConstructor();

  factory DatabaseService() {
    return _instance;
  }

  final String _databaseName = "foodDatabase.db";
  final String _tableName = "food";
  final int _databaseVersion = 1;
  final String id_column = "id";
  final String name_column = "foodName";
  Database? _database;

  Future<Database> get database async {
    return _database ??= await initializeDatabase();
  }

  Future<Database> initializeDatabase() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, _databaseName);
    var createDatabase =
        openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
    return createDatabase;
  }

  Future<void> _onCreate(Database db, int version) async {
    String createFoodTable =
        "CREATE TABLE $_tableName($id_column INTEGER PRIMARY KEY AUTOINCREMENT,$name_column TEXT)";
    db.execute(createFoodTable);
  }

  Future<int> insertData(FoodModel food) async {
    var databaseClient = await database;

    int insertResult = await databaseClient.insert(_tableName, food.toMap());
    return insertResult;
  }

  Future<List<Map<String, Object?>>> selectData() async {
    var databaseClient = await database;

    String selectSql = "SELECT * FROM $_tableName";

    var selectResult = databaseClient
        .rawQuery(selectSql); // [{"id": 1, "name": "Apple"},{},{}]

    return selectResult;
  }
}
// Baby , can you hear me?
// please, can I call you babe?
// please answer my phone babe?
// please babe
// what r u doing?
// chit, bar lote nay tar
// please, answer phone
// 