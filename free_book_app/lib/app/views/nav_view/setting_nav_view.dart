import 'package:flutter/material.dart';
import 'package:free_book_app/app/controllers/home_controller.dart';
import 'package:free_book_app/app/views/favorite_view.dart';
import 'package:get/get.dart';

class SettingNavView extends StatelessWidget {
  SettingNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white12,
      ),
      body: Column(
        children: [
          InkWell(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 25.5,
                  ),
                ),
                Text(
                  'Favorites',
                  style: TextStyle(fontSize: 15.5),
                ),
              ],
            ),
            onTap: () => Get.to(const FavoriteView()),
          ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.save_alt,
                  size: 25.5,
                ),
              ),
              Text(
                'Downloads',
                style: TextStyle(fontSize: 15.5),
              ),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.info_outline,
                  size: 25.5,
                ),
              ),
              Text(
                'About',
                style: TextStyle(fontSize: 15.5),
              ),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.article_outlined,
                  size: 25.5,
                ),
              ),
              Text(
                'Licenses',
                style: TextStyle(fontSize: 15.5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
