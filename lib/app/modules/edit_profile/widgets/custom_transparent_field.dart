import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';

class CustomTransparentField extends StatelessWidget {
  const CustomTransparentField({
    super.key,
    required this.name,
    required this.bio,
    required this.isEditing,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.hintText,
  });

  final TextEditingController name;
  final TextEditingController bio;
  final bool isEditing;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 160.w,
      child: TextField(
        controller: name,
        enabled: isEditing,
        textAlign: TextAlign.center,
        cursorColor: color ?? bgBlack,
        cursorHeight: 15.h,
        maxLines: null,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText ?? "",
          focusedBorder: isEditing
              ? UnderlineInputBorder(borderSide: BorderSide(color: color ?? bgBlack, width: 1.w))
              : InputBorder.none,
          border: isEditing
              ? UnderlineInputBorder(borderSide: BorderSide(color: color ?? bgBlack, width: 1.5.w))
              : InputBorder.none,
        ),
        style: textStyles(fontSize ?? 15, color ?? bgBlack, fontWeight ?? bold),
      ),
    );
  }
}