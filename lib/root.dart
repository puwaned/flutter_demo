import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lpt_client/routers/route-path.dart';
import 'package:lpt_client/routers/routes.dart';
import 'package:lpt_client/screens/loading/loading-screen.dart';
import 'package:lpt_client/services/root.dart';
import 'package:lpt_client/widgets/builder/fade-page-builder.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'configs/translations/translation.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RootApp();
  }
}

class _RootApp extends State<RootApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (ctx, widget) {
        return ResponsiveWrapper.builder(LoadingScreen(screen: widget!),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ]);
      },
      initialRoute: RoutePath.initial,
      initialBinding: RootServiceBindings(_navigatorKey),
      onGenerateRoute: (RouteSettings settings) {
        final route = Routes.getRoutes(settings);
        final WidgetBuilder builder = route[settings.name]!;
        return FadePageRouteBuilder(builder: builder, settings: settings);
      },
      translations: AppTranslation(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(),
    );
  }
}
