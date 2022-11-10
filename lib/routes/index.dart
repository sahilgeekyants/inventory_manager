import 'package:flutter/material.dart';
import '../ui/pages/home_page/index.dart';
import '../ui/pages/login_page/index.dart';
import '../ui/pages/splash_page/index.dart';
import 'route_util.dart';

class SetupRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // case "/auth":
      //   return MaterialPageRoute(builder: (context) => Auth());
      // case "/register_or_login":
      //   return MaterialPageRoute(builder: (context) => RegisterOrLogin(scanData: settings.arguments as ScanData));
      // case "/scan_qr_code":
      //   return MaterialPageRoute(builder: (context) => ScanQRCode());
      // case "/login":
      //   return MaterialPageRoute(builder: (context) => LoginScreen());
      // case '/register':
      //   return MaterialPageRoute(builder: (context) => RegisterScreen());
      // case "/get_started":
      //   return MaterialPageRoute(builder: (context) => GetStarted());
      // case "/permission_stack":
      //   return MaterialPageRoute(builder: (context) => PermissionPageView());

      // case "/home":
      //   return MaterialPageRoute(builder: (context) => MyHomePage());
      // case "/threat_details":
      //   return MaterialPageRoute(
      //       builder: (context) => ThreatDetails(arguments: settings.arguments as Map<String, Report>?));
      // default:
      //   return MaterialPageRoute(builder: (context) => SplashScreen());

      // case "/home_chats":
      case Routes.loginPath:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case Routes.homePath:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
