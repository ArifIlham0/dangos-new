import 'package:flutter/material.dart';

const Color bgWhite = Colors.white;
const Color bgBlack = Colors.black;
const Color lightBlue = Color(0xFFE6EEFA);
const Color blue = Color(0xFF5790DF);
const Color darkBlue = Color(0xFF093D89);
const Color iconBlack = Color(0xFF28303F);
const Color lightBlack = Color(0xFF6C7A9C);
const Color green = Color(0xFF3FBC45);
const Color grey = Color(0xFFF3F3F3);
const Color lightPurple = Color(0xFFC7D7FE);
const Color kRedIOS = Color(0xFFFF0000);
const Color lightRed = Color(0xFFD14343);

Color getColor(BuildContext context, Color light, Color dark) {
  return Theme.of(context).brightness == Brightness.dark ? dark : light;
}
