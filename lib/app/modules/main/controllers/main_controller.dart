import 'package:dangos/app/modules/view_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;
  var isVisible = true.obs;

  final List<Widget> _pages = [
    const HomeView(),
    const MyPostView(),
  ];

  List<Widget> get pages => _pages;

  @override
  void onInit() {
    super.onInit();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
