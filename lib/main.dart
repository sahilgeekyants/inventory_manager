import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/services/page_service.dart';

import 'routes/index.dart';
import 'ui/pages/splash_page/index.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

//Navigation key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    AllBlocModel? allBlocModel = PageService(EnumPageIntent.Splash).getBlocModel(getAllBlocModel: true);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => allBlocModel!.loginBloc),
        BlocProvider<HomeBloc>(create: (BuildContext context) => allBlocModel!.homeBloc),
      ],
      child: MaterialApp(
        title: 'Inventory Demo',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          primarySwatch: white,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: const SplashPage(),
        onGenerateRoute: SetupRoutes.generateRoutes,
      ),
    );
  }
}
