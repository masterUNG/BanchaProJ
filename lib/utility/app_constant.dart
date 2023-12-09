import 'package:flutter/material.dart';

class AppConstant {
  static Color bgColor = const Color.fromARGB(255, 48, 127, 52);
  static Color primaryColor = const Color.fromARGB(255, 63, 176, 69);

  static String urlWebView = 'https://www.facebook.com';

  BoxDecoration curveBorder() => BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: primaryColor);

  TextStyle h1Style({Color? color, double? size}) => TextStyle(
        color: color,
        fontSize: size ?? 36,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style({Color? color, double? size}) => TextStyle(
        color: color,
        fontSize: size ?? 22,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style({Color? color, double? size}) => TextStyle(
        color: color,
        fontSize: size ?? 14,
        fontWeight: FontWeight.normal,
      );
}
