import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppService extends GetxController {
  static final RxBool _loading = false.obs;
  final Rx<PageController> _pageController = PageController(initialPage: 0).obs;
  final RxInt _homeIndex = 0.obs;

  static void setLoading(bool loading) {
    _loading.value = loading;
  }

  void jumpToPage(int index) {
    _pageController.value.jumpToPage(index);
    _homeIndex.value = index;
  }

  bool get loading => _loading.value;
  int get homeIndex => _homeIndex.value;
  PageController get homePageController => _pageController.value;
}
