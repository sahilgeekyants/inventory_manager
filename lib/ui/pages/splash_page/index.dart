import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  String welcomeText = 'Welcome to Pilog';
  // void navigationPage() {
  //   navigatorKey.currentState!.pushReplacementNamed(Routes.loginPath);
  // }

  startTime() async {
    var duration = const Duration(seconds: 2);
    // await appSetUp();
    // return Timer(duration, navigationPage);
    return Timer(duration, isAuthentication);
  }

  Future isAuthentication() async {
    try {
      //walk through
      bool iswalkThroughComplete = await localStorage.getIsWalkThroughComplete();
      if (!iswalkThroughComplete) {
        await localStorage.setIsWalkThroughComplete(status: true);
        if (kDebugMode) {
          print('goto login now after splash');
        }
        //go to login
        navigatorKey.currentState!.pushReplacementNamed(Routes.loginPath);
      } else {
        if (kDebugMode) {
          print('goto home directly because already logged in');
        }
        //already loged in, go to home
        navigatorKey.currentState!.pushReplacementNamed(Routes.homePath);
      }
    } catch (err) {
      if (kDebugMode) {
        print("err is $err");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    //fix orientation for now
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    WidgetsBinding.instance.addObserver(this);
    ScreenUtil.init(width: 375, height: 812, allowFontScaling: true);
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(welcomeText),
      ),
    );
  }
}
