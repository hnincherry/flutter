import 'package:get/get.dart';
import 'package:test_getx/home.dart';
import 'package:test_getx/second_page.dart';
import 'package:test_getx/test_counter.dart';

class AppPage {
  static const String? INITIAL = '/home';
  static final routes = [
    GetPage(name: '/home', page: () => const Home()),
    GetPage(name: '/second_page', page: () => const SecondPage()),
    GetPage(name: '/test_counter', page: () => TestCounter()),
  ];
}
