import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lpt_client/services/app/app-service.dart';

import '../../widgets/display/indicator.dart';

class LoadingScreen extends StatefulWidget {
  final Widget screen;
  const LoadingScreen({super.key, required this.screen});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreen();
  }
}

class _LoadingScreen extends State<LoadingScreen> {
  final appService = Get.find<AppService>(tag: 'app');

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          bottom: false,
          child: GestureDetector(
            onTap: () {},
            child: Obx(() => Stack(
                  fit: StackFit.expand,
                  children: [
                    widget.screen,
                    if (appService.loading)
                      const Scaffold(
                        backgroundColor: Colors.black54,
                        body: Center(
                          child: AppIndicator(),
                        ),
                      )
                  ],
                )),
          ),
        ));
  }
}
