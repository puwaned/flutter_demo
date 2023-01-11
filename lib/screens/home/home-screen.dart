import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lpt_client/screens/home/main/main-screen.dart';
import 'package:lpt_client/screens/home/setting/setting-screen.dart';
import 'package:lpt_client/services/app/app-service.dart';

class HomeScreen extends HookWidget {
  final appService = Get.find<AppService>(tag: 'app');
  final PageStorageKey _key = const PageStorageKey('home-page-key');

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => PageView(
            key: _key,
            controller: appService.homePageController,
            physics: const NeverScrollableScrollPhysics(),
            children:  [MainScreen(), SettingScreen()],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: appService.homeIndex,
            onTap: appService.jumpToPage,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
            ],
          )),
    );
  }
}
