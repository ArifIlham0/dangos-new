import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 5.w,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => Get.back(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 12.w),
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(AppIcons.arrow),
        ),
      ),
    );
  }
}