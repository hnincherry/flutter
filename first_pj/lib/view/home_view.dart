import 'dart:developer';

import 'package:first_pj/controller/food_controller.dart';
import 'package:first_pj/model/food_model.dart';
import 'package:first_pj/view/second_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Project"),
      ),
      body: Container(
        child: Consumer<FoodController>(builder: (context, controller, widget) {
          return ListView.builder(
              itemCount: controller.foodList.length,
              itemBuilder: ((context, index) {
                //log('dataList => ${controller.foodList}');
                // we have to get each data Object from Object List by seaking index
                // List[FoodModel(id,foodName),FoodModel(id,foodName)]
                // List[0] => FoodModel
                // FoodModel => foodName

                // ['key] -> map
                // object.key/variable/attribute -> Object

                FoodModel foodData =
                    controller.foodList[index]; // data -> Object

                String name = foodData.foodName ?? '';
                return ListTile(
                  title: Text("$name"),
                );
              })); // View <===> controler <==> Service
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
