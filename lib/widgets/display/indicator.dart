import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum SpinType { squareCircle, wave }

class AppIndicator extends HookWidget {
  final SpinType spinType;

  const AppIndicator({super.key, this.spinType = SpinType.wave});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 1200));

    switch (spinType) {
      case SpinType.squareCircle:
        return SizedBox(
          height: 100,
          child: SpinKitSquareCircle(
              color: Colors.red, size: 50.0, controller: controller),
        );
      case SpinType.wave:
        return SizedBox(
          height: 100,
          child: SpinKitWave(
              color: Colors.red, size: 50.0, controller: controller),
        );
    }
  }
}
