import 'package:flutter/cupertino.dart';

class ScreenContainer extends StatelessWidget {
  final Widget screen;
  const ScreenContainer({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: screen,
    );
  }
}
