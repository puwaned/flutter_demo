import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lpt_client/services/dio/dio-service.dart';
import '../../routers/route-path.dart';
import '../../widgets/display/indicator.dart';

class SplashScreen extends StatefulHookWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  final dioService = Get.find<DioService>(tag: 'dio');

  @override
  void initState() {
    _redirect();
    super.initState();
  }

  _redirect() async {
    var localToken = await dioService.getLocalToken();
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (localToken != null) {
        Get.offNamed(RoutePath.home);
      } else {
        Get.offNamed(RoutePath.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppIndicator(spinType: SpinType.squareCircle,),
          Text('check-for-update'.tr),
        ],
      ),
    ));
  }
}

