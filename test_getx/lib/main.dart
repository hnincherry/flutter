import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_getx/appPage.dart';
import 'package:test_getx/generated/locales.g.dart';
import 'package:test_getx/home.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPage.INITIAL,
      getPages: AppPage.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      fallbackLocale: Locale("en", "US"),
      translationsKeys: AppTranslation.translations,
      locale: Locale("en", "US"),
      home: Home(),
    );
  }
}
