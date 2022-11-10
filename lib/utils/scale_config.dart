import 'package:flutter/material.dart';

class SizeScaleConfig {
  static const double baseHeight = 960.0;
  static const double baseWidth = 454.7368421052632;

  static double screenHeight = baseHeight;
  static double screenWidth = baseWidth;
  static double heightScaleRatio = 1;
  static double widthScaleRatio = 1;
  static double scaleFactor = 1;

  void calculateScaleRatios(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    screenHeight = screenSize.height;
    screenWidth = screenSize.width;
    scaleFactor = MediaQuery.of(context).textScaleFactor;
    heightScaleRatio = screenHeight / baseHeight;
    widthScaleRatio = screenWidth / baseWidth;
  }

  double scaleHeight(num actualHeight) {
    return actualHeight * heightScaleRatio * scaleFactor;
  }

  double scaleWidth(num actualWidth) {
    return actualWidth * widthScaleRatio * scaleFactor;
  }
}

extension ScaleConfigExtension on num {
  double get toHeight => SizeScaleConfig().scaleHeight(this);
  double get toWidth => SizeScaleConfig().scaleWidth(this);
  // double get toFont => ScreenUtil()?.setSp(this) as double;
}
