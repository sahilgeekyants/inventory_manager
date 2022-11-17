import 'package:flutter/material.dart';
import 'package:inventory_manager/services/page_service.dart';
import '../ui/pages/home_page/index.dart';
import '../ui/pages/login_page/index.dart';
import '../ui/pages/splash_page/index.dart';
import 'route_util.dart';

class SetupRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    EnumPageIntent pageIntent = RouteToPageIntent[settings.name]!;
    PageService pageService = PageService(pageIntent);
    switch (settings.name) {
      // case "/auth":
      //   return MaterialPageRoute(builder: (context) => Auth());
      // case "/register_or_login":
      //   return MaterialPageRoute(builder: (context) => RegisterOrLogin(scanData: settings.arguments as ScanData));
      // case "/login":
      //   return MaterialPageRoute(builder: (context) => LoginScreen());
      // case "/threat_details":
      //   return MaterialPageRoute(
      //       builder: (context) => ThreatDetails(arguments: settings.arguments as Map<String, Report>?));
      // default:
      //   return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.loginPath:
        return MaterialPageRoute(builder: (context) => LoginPage(loginPageBlocModel: pageService.getBlocModel()));
      case Routes.homePath:
        return MaterialPageRoute(builder: (context) => HomePage(homePageBlocModel: pageService.getBlocModel()));
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
