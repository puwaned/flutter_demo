import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lpt_client/routers/route-path.dart';
import 'package:lpt_client/services/dio/dio-service.dart';

class SettingScreen extends HookWidget {
  final dioService = Get.find<DioService>(tag: 'dio');
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Center(
      child: TextButton(
        child: Text('logout'),
        onPressed: () {
          dioService.logout();
          Get.offAllNamed(RoutePath.login);
        },
      ),
    );
  }
}
