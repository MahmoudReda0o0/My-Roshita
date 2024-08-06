import 'package:flutter/material.dart';
import 'package:my_roshita/main.dart';

double mediaH = MediaQuery.of(navigationKey.currentContext!).size.height;
double mediaW = MediaQuery.of(navigationKey.currentContext!).size.width;

class ColorApp {
  static Color green = const Color(0xFF8BC34A); //Primary
  static Color greenLight = const Color(0xFFDCEDC8); // Light Primary
  static Color greenDark = const Color(0xFF689F38); // Dark Primary

  static Color blueLight = const Color(0xFF03A9F4); // Accent
  static Color black = const Color(0xff212121);
  static Color white = const Color(0xffF6F4F4);
  static Color grayLight = const Color(0xffBDBDBD); // Divider
}
