import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customNavigation(
  Widget Function() child, {
  bool? isOffAll,
  Transition? transition,
  Bindings? bindings,
}) {
  if (Platform.isIOS) {
    if (isOffAll == true) {
      Get.offAll(child, binding: bindings);
    } else {
      Get.to(child, binding: bindings);
    }
  } else {
    if (isOffAll == true) {
      Get.offAll(
        child,
        transition: transition ?? Transition.rightToLeft,
        duration: const Duration(milliseconds: 100),
        binding: bindings,
      );
    } else {
      Get.to(
        child,
        transition: transition ?? Transition.rightToLeft,
        duration: const Duration(milliseconds: 100),
        binding: bindings,
      );
    }
  }
}
