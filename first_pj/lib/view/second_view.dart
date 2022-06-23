import 'dart:developer';

import 'package:first_pj/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondView extends StatelessWidget {
  SecondView({Key? key}) : super(key: key);

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _foodController = Provider.of<FoodController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          TextField(
            decoration: InputDecoration(labelText: "Food Name"),
            controller: _nameController,
          ),
          ElevatedButton(
              onPressed: () async {
                String name = _nameController.text;
                if (name.isNotEmpty) {
                  int count = await _foodController.insertData(name);
                  if (count > 0) {
                    _foodController.getAllData();
                    Navigator.pop(context);
                  }
                } else {
                  log("Name is Empty");
                }
              },
              child: Text("Add Data")),
        ]),
      ),
    );
  }
}
