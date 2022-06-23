import 'package:flutter/material.dart';
import 'package:foody_girl/controller/food_controller.dart';
import 'package:foody_girl/model/food_model.dart';
import 'package:foody_girl/view/add_view.dart';
import 'package:foody_girl/view/update_view.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _foodController = Provider.of<FoodController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Foody Girl")),
      body: Container(
        child: Consumer<FoodController>(builder: (context, controller, widget) {
          return ListView.builder(
            itemCount: controller.foodList.length,
            itemBuilder: ((context, index) {
              FoodModel foodData = controller.foodList[index];
              String name = foodData.foodName ?? '';
              String category = foodData.category ?? '';
              int qty = foodData.qty ?? 0;
              return ListTile(
                title: Row(
                  children: [
                    Text(name),
                    Text(
                      "Qty: $qty",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                trailing: SizedBox(
                  width: 50.4,
                  child: Row(
                    children: [
                      InkWell(
                        child: const Icon(Icons.edit_outlined),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateView(model: foodData)));
                        },
                      ),
                      InkWell(
                        child: const Icon(Icons.remove_circle_outline),
                        onTap: () {
                          _foodController.deleteData(foodData.id!);
                        },
                      ),
                    ],
                  ),
                ),
                subtitle: Text(category),
              );
            }),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddView()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
