import 'package:flutter/cupertino.dart';
import 'package:lpt_client/routers/route-path.dart';
import 'package:lpt_client/screens/home/home-screen.dart';
import 'package:lpt_client/screens/login/login-screen.dart';
import 'package:lpt_client/screens/splash/splash-screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RoutePath.initial: (ctx) => const SplashScreen(),
        RoutePath.home: (ctx) => HomeScreen(),
        RoutePath.login: (ctx) => LoginScreen()
      };
}
