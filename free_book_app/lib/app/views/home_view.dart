import 'package:flutter/material.dart';
import 'package:free_book_app/app/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => homeController.navViewList
            .elementAt(homeController.selectedIndex.value)),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ],
            currentIndex: homeController.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: homeController.onItemTapped,
          ),
        ));
  }
}

// 1. Home / Explore/ Setting
// 2. bottom navigation bar => [Home / Explore/ Setting]
