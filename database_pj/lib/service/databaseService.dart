import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//SingleTone => don't repeatly create class instance memory

class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService _instance =
      DatabaseService._privateConstructor();

  factory DatabaseService() {
    return _instance;
  }

  final String _databaseName = "myDatabase.db";

  final String _tableName = "user";

  final int _databaseVersion = 1;

  final String id_column = "id";

  final String name_column = "Name";

  Database? _database;

  Future<Database> get database async {
    return _database ??= await initializeDatabase();
  }

  Future<Database> initializeDatabase() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, _databaseName);
    var createDatabase =
        openDatabase(path, version: _databaseVersion, onCreate: _oncreate);
    return createDatabase;
  }

  Future<void> _oncreate(Database db, int version) async {
    String createUserTable =
        "CREATE TABLE $_tableName($id_column INTEGER PRIMARY KEY AUTOINCREMENT, $name_column TEXT)";
    db.execute(createUserTable);
  }

  Future<int> insertData(String name) async {
    var databaseClient = await database;

    int insertResult =
        await databaseClient.insert(_tableName, {name_column: name});
    return insertResult;
  }

  Future<List<Map<String, Object?>>> selectData() async {
    var databaseClient = await database;

    String selectSql = "SELECT * FROM $_tableName";

    var selectResult = databaseClient.rawQuery(selectSql);
    return selectResult;
  }

  Future<List<Map<String, Object?>>> updateData(int id, String name) async {
    var databaseClient = await database;

    String updateSql =
        "UPDATE $_tableName SET $name_column='$name' WHERE $id_column=$id";
    var updateResult = databaseClient.rawQuery(updateSql);
    return updateResult;
  }

  Future<List<Map<String, Object?>>> deleteData(int id) async {
    var databaseClient = await database;

    String deletesql = "DELETE FROM $_tableName WHERE $id_column=$id";
    var deleteResult = databaseClient.rawQuery(deletesql);
    return deleteResult;
  }

  Future closeDatabase() async {
    var databaseClient = await database;
    return databaseClient.close();
  }
}
