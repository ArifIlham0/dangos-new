import 'dart:ui';
import 'package:dangos/app/modules/home/controllers/home_controller.dart';
import 'package:dangos/app/modules/main/widgets/custom_navbar_item.dart';
import 'package:dangos/app/modules/main/widgets/custom_blur_notch.dart';
import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            IndexedStack(
              index: controller.selectedIndex.value,
              children: controller.pages,
            ),
            Obx(() {
              if (homeController.pinnedAppBar.value) {
                return SafeArea(
                  bottom: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipPath(
                          clipper: CustomBlurNotch(fabRadius: 55.w),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              height: 80.h,
                              color: Colors.white.withAlpha(51),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                          child: BottomAppBar(
                            padding: EdgeInsets.zero,
                            height: 80.h,
                            color: blue.withAlpha(225 * 60),
                            shape: const CircularNotchedRectangle(),
                            notchMargin: 25.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomNavbarItem(
                                  icon: SvgPicture.asset(AppIcons.house),
                                  index: 0,
                                  isSelected: controller.selectedIndex.value == 0,
                                  onTap: () => controller.changeIndex(0),
                                ),
                                SizedBox(width: 50.w),
                                CustomNavbarItem(
                                  icon: SvgPicture.asset(AppIcons.myPost),
                                  index: 1,
                                  isSelected: controller.selectedIndex.value == 1,
                                  onTap: () => controller.changeIndex(1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        if (homeController.pinnedAppBar.value) {
          return Padding(
            padding: EdgeInsets.only(top: 35.h),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          width: 80.w,
                          height: 80.h,
                          color: Colors.white.withAlpha(46),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 65.w,
                  height: 65.h,
                  child: FloatingActionButton(
                    elevation: 0,
                    onPressed: () {
                      customSnackbar("Feature Coming Soon");
                    },
                    backgroundColor: bgWhite.withAlpha(255 * 60),
                    shape: const CircleBorder(),
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
