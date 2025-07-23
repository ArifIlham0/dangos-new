import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';

class NotifProfileCard extends StatelessWidget {
  const NotifProfileCard({
    super.key,
    required this.title,
    required this.message,
    this.index = 0,
  });

  final String title;
  final String message;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: index == 0 ? 20.w : 0),
          child: Divider(color: bgBlack.withAlpha(50), height: 1.h),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textStyles(14, bgBlack, semiBold),
              ),
              SizedBox(height: 6.h),
              Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyles(13, lightBlack, regular),
              ),
            ],
          ),
        ),
      ],
    );
  }
}