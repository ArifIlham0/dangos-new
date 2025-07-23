import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key, 
    required this.pinnedAppBar,
    required this.leadingIcon,
    required this.title,
    this.actionIcon,
    this.onTapLeading,
    this.onTapAction,
  });

  final RxBool pinnedAppBar;
  final Widget leadingIcon;
  final String title;
  final Widget? actionIcon;
  final VoidCallback? onTapLeading;
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverAppBar(
        title: Text(title, style: textStyles(20, bgBlack, semiBold)),
        centerTitle: true,
        backgroundColor: bgWhite,
        floating: true,
        scrolledUnderElevation: 0,
        pinned: pinnedAppBar.value,
        leadingWidth: 60.w,
        leading: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onTapLeading ?? () => Get.back(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: leadingIcon,
              ),
            ),
          ],
        ),
        actions: actionIcon != null 
        ? [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTapAction,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: actionIcon
            ),
          ),
        ] 
        : null
      );
    });
  }
}
