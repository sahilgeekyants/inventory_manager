// const String loginPath = '/login';
// const String splashPath = '/splash';
// const String homeChatsPath = '/homeChats';

//  enum EnumPageIntent {
//   loginPage(loginPath),
//   splashPage(splashPath),
//   homeChatsPage(homeChatsPath),
//   ;

//   //enum with string value
//   const EnumPageIntent(this.value);
//   final String value;
// }

class Routes {
  static const String splash = '/';
  static const String loginPath = '/login';
  static const String homePath = '/home';
}

// ignore: non_constant_identifier_names
Map<String, EnumPageIntent> RouteToPageIntent = {
  Routes.splash: EnumPageIntent.Splash,
  Routes.loginPath: EnumPageIntent.Login,
  Routes.homePath: EnumPageIntent.Home,
};

enum EnumPageIntent {
  // ignore: constant_identifier_names
  Splash,
  // ignore: constant_identifier_names
  Login,
  // ignore: constant_identifier_names
  Home,
}
