import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lpt_client/services/app/app-service.dart';
import 'package:lpt_client/services/dio/dio-service.dart';
import 'package:lpt_client/services/user/user-service.dart';

class RootServiceBindings implements Bindings {
  final GlobalKey<NavigatorState> _navigatorKey;
  RootServiceBindings(this._navigatorKey);

  @override
  void dependencies() {
    var dioService = DioService();
    var dio = dioService.getInstance();

    var userService = UserService(dio: dio);
    var appService = AppService();

    Get.put<UserService>(userService, tag: 'user');
    Get.put<AppService>(appService, tag: 'app', permanent: true);
    Get.put<DioService>(dioService, tag: 'dio', permanent: true);
  }
}
