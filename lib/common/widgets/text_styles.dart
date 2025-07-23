import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle textStyles(double size, Color color, FontWeight fontWeight, {FontStyle fontStyle = FontStyle.normal}) {
  return TextStyle(fontSize: size.sp, color: color, fontFamily: "Poppins", fontWeight: fontWeight, fontStyle: fontStyle);
}
