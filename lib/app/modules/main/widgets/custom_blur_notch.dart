import 'package:flutter/material.dart';

class CustomBlurNotch extends CustomClipper<Path> {
  CustomBlurNotch({this.fabRadius = 35});
  
  final double fabRadius;

  @override
  Path getClip(Size size) {
    final double notchWidth = fabRadius * 2 + 20;
    final double notchDepth = fabRadius;
    final double centerX = size.width / 2;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(centerX - notchWidth / 2, 0);

    path.cubicTo(
      centerX - fabRadius,
      0,
      centerX - fabRadius,
      notchDepth,
      centerX,
      notchDepth,
    );
    path.cubicTo(
      centerX + fabRadius,
      notchDepth,
      centerX + fabRadius,
      0,
      centerX + notchWidth / 2,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}