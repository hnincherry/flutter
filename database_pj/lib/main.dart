import 'dart:developer';

import 'package:database_pj/service/databaseService.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Database Pj",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseService databaseService = DatabaseService();
  TextEditingController _textEditingController = TextEditingController();

  Future<void> insert() async {
    String nameStr = _textEditingController.text;
    if (nameStr.isNotEmpty) {
      var insertData = await databaseService.insertData(nameStr);
      log("Insert Data => ${insertData}");
    }
  }

  Future<void> select() async {
    var selectData = await databaseService.selectData();
    log("Select Data => ${selectData}");
  }

  Future<void> update() async {
    String str = _textEditingController.text;
    if (str.isNotEmpty) {
      var updateData = await databaseService.updateData(1, str);
      log("Update Data => ${updateData}");
    }
  }

  Future<void> delete() async {
    String idStr = _textEditingController.text;
    var deleteData = databaseService.deleteData(int.parse(idStr));
    log("Delete Data => ${deleteData}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Database Project")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textEditingController,
          ),
          ElevatedButton(
              onPressed: () {
                insert();
              },
              child: Text("Insert")),
          ElevatedButton(
              onPressed: () {
                select();
              },
              child: Text("Select")),
          ElevatedButton(
              onPressed: () {
                update();
              },
              child: Text("Update")),
          ElevatedButton(
              onPressed: () {
                delete();
              },
              child: Text("Delete")),
        ],
      )),
    );
  }
}
