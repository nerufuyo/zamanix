import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    this.width,
    this.height,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.color,
  });

  final double? width;
  final double? height;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: Container(
        width: width ?? 140,
        height: height ?? 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? AppColor.primary,
        ),
      ),
    );
  }
}
