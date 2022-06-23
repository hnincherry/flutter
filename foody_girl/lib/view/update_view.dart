import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foody_girl/model/food_model.dart';
import 'package:provider/provider.dart';

import '../controller/food_controller.dart';

class UpdateView extends StatefulWidget {
  final FoodModel model;

  const UpdateView({Key? key, required this.model}) : super(key: key);

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  int _id = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  // get data from TextField => controller.text
  // set data to TextField => controller.text = "data"

  // 1. get data from first page
  // 2. set data to TextField in second page
  // example => _nameController.text = model.foodName, ......

  // 1. need to understand , how to get data from first page
  // 2. need to understand, how to bind data to TextField value

  @override
  void initState() {
    _id = widget.model.id!;
    _nameController.text = widget.model.foodName!;
    _categoryController.text = widget.model.category!;
    _qtyController.text = "${widget.model.qty!}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _foodController = Provider.of<FoodController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Update View")),
      body: Column(children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
              hintText: "Enter Food Name",
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
              hintText: "Enter category name",
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
              hintText: "Enter Qty",
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
                await _foodController.updateData(_id, name, category, qty);
                Navigator.pop(context);

                log("Update Success");
                log("$_id , ${_nameController.text}, ${_categoryController.text}, ${_qtyController.text}");
              }
            },
            child: const Text("UPDATE")),
      ]),
    );
  }
}
