import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/get_storage_service.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController name_controller = TextEditingController();
  var getStorage = GetStorageService();
  String _name = "";
  String _argu = "";

  void getDataMethod() {
    setState(() {
      _name = getStorage.getData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataMethod();
    _argu = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Second Screen")),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: name_controller,
              decoration: InputDecoration(
                  labelText: "Enter your name", hintText: "$_name"),
            ),
            ElevatedButton(
                onPressed: () {
                  getStorage.saveToDevice(name_controller.text);
                },
                child: const Text("Submit")),
            ElevatedButton(
              onPressed: () {
                getDataMethod();
                log("Read Name => $_name");
              },
              child: Text("Read"),
            ),
            Text("$_name"),
            Text("$_argu"),
          ]),
        )));
// 1. if click Read button, get data from storage and then show in UI
// => what we need to do
// 1. initialize global variable for Text UI view
// 2. Read button -> on clikc -> call read method -> set data to variable
// 3. setState()
  }
}
