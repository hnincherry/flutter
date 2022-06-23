import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foody_girl/controller/food_controller.dart';
import 'package:provider/provider.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _foodController = Provider.of<FoodController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Add View")),
      body: Column(children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
              labelText: "Enter Food Name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(12.5)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(12.5)))),
        ),
        TextField(
          controller: _categoryController,
          decoration: const InputDecoration(
              labelText: "Enter category",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(12.5)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(12.5)))),
        ),
        TextField(
          controller: _qtyController,
          decoration: const InputDecoration(
              labelText: "Enter quantity",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(12.5)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(12.5)))),
        ),
        ElevatedButton(
            onPressed: () async {
              String name = _nameController.text;
              String category = _categoryController.text;
              int qty = int.parse(_qtyController.text);

              if (name.isNotEmpty && category.isNotEmpty && qty >= 0) {
                int count =
                    await _foodController.insertData(name, category, qty);
                if (count > 0) {
                  _foodController.getAllData();
                  Navigator.pop(context);
                } else {
                  log("Fields are Empty");
                }
              }
            },
            child: const Text("SAVE")),
      ]),
    );
  }
}
