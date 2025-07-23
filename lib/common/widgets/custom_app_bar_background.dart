import 'package:dangos/core/core_export.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBarBackground extends StatelessWidget {
  const CustomAppBarBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.appBarBackground, 
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}