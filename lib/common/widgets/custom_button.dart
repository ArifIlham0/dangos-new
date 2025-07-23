import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
  });

  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 85.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: bgBlack,
          backgroundColor: color ?? bgWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        ),
        child: Text(
          title,
          style: textStyles(13, textColor ?? bgBlack, semiBold),
        ),
      ),
    );
  }
}