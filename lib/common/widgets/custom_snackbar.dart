import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController? customSnackbar(String text, {Color? color, Duration? duration}) {
  if (Get.isSnackbarOpen) return null;
  return Get.snackbar(
    "",
    text,
    borderRadius: 10,
    backgroundColor: color ?? blue,
    titleText: const SizedBox.shrink(),
    duration: duration ?? const Duration(seconds: 2),
    animationDuration: Duration.zero,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: textStyles(14, bgWhite, semiBold),
            maxLines: null,
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            "Close",
            style: textStyles(12, bgWhite, regular),
          ),
        ),
      ],
    ),
  );
}