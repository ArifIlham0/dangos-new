import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: height ?? Get.height * 0.25),
        Lottie.asset("assets/lotties/no_data.json"),
        Text("No Data Available", style: textStyles(15, bgBlack, semiBold)),
      ],
    );
  }
}
