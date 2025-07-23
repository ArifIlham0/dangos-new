import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customDialog(BuildContext context, {
    VoidCallback? onCancel, 
    String? onConfirmText,
    required String title, 
    required VoidCallback onConfirm,
  }) {
    return Get.dialog(
      AlertDialog(
        backgroundColor: getColor(context, bgWhite, bgWhite),
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: textStyles(12, bgBlack, semiBold)
        ),
        actions: [
          CustomButton(
            title: "no".tr,
            width: 70.w,
            onPressed: () => onCancel ?? Get.back(),
          ),
          CustomButton(
            title: onConfirmText ?? "yes".tr,
            color: blue,
            textColor: bgWhite,
            width: 70.w,
            onPressed: () => onConfirm(),
          ),
        ],
      ),
    );
  }