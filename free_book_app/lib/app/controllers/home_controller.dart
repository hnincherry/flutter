import 'package:free_book_app/app/models/book_model.dart';
import 'package:free_book_app/app/providers/home_provider.dart';
import 'package:free_book_app/app/views/nav_view/explore_nav_view.dart';
import 'package:free_book_app/app/views/nav_view/home_nav_view.dart';
import 'package:free_book_app/app/views/nav_view/setting_nav_view.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
// get object data from provider
// set to observable variable for UI

  final homeProvider = HomeProvider();
  final selectedIndex = 0.obs;

  // initialize bookList
  final bookList = <BookModel>[].obs;

  final navViewList = [HomeNavView(), ExploreNavView(), SettingNavView()];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void getBookList() async {
    bookList.value = await homeProvider.getBookList();
  }

  @override
  void onInit() {
    getBookList();
    super.onInit();
  }
}
