import 'package:flutter/cupertino.dart';

abstract class AppDimensions{
  static double fullScreenWidth (BuildContext context) => MediaQuery.sizeOf(context).width;
  static double fullScreenHeight (BuildContext context) => MediaQuery.sizeOf(context).height;
  static double halfScreenWidth (BuildContext context) => MediaQuery.sizeOf(context).width / 2;
  static double halfScreenHeight (BuildContext context) => MediaQuery.sizeOf(context).height / 2;
  static double quarterAndHalfScreenHeight (BuildContext context) => MediaQuery.sizeOf(context).height /4.5;
  static double oneFifthScreenHeight (BuildContext context) => MediaQuery.sizeOf(context).height / 5;
  static double oneSixthScreenHeight (BuildContext context) => MediaQuery.sizeOf(context).height / 6;
  static double buttonWidth (BuildContext context) => MediaQuery.sizeOf(context).width / 1.5;
  static const double buttonHeight = 60;
  static const double textFieldPadding = 45;
  static const double buttonTextSize = 24;
  static const double extraSmallTextSize = 13;
  static const double smallTextSize = 18;
  static const double mediumTextSize = 22;
  static const double largeTextSize = 42;
  static const double smallPadding = 14;
  static const double mediumPadding = 25;
  static const double largePadding = 40;
}