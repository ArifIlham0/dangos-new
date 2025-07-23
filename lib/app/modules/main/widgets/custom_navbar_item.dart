import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';

class CustomNavbarItem extends StatelessWidget {
  const CustomNavbarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.index,
  });
  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [ 
            SizedBox(height: 14.h),
            icon,
            if (isSelected)
              Container(
                height: 3.h,
                width: 20.w,
                margin: EdgeInsets.only(top: 3.h),
                decoration: BoxDecoration(
                  color: bgWhite,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              )
            else
              SizedBox(height: 11.h),
          ],
        ),
      ),
    );
  }
}
