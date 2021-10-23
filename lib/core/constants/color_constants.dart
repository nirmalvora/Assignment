import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  static const Color appBarColor = Colors.white;
  static const Color primaryColor = Color(0xffA6191F);
  static const Color actionBarIconColor = Colors.black;
  static const Color appBarTitleColor = Colors.black;
  static const Color deleteIconColor = Colors.red;

  static const Color mediumGrey = Color(0xff7C7C7C);

  static const Color lightGrey = Color(0xffB2B9BF);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
