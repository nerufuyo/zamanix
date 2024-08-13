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

class DotBackground extends StatelessWidget {
  const DotBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DotWidget(
          width: 140,
          height: 140,
          bottom: MediaQuery.sizeOf(context).height * .8,
          right: MediaQuery.sizeOf(context).width * .8,
          color: AppColor.accent.withOpacity(.125),
        ),
        DotWidget(
          width: 140,
          height: 140,
          top: MediaQuery.sizeOf(context).height * .55,
          left: MediaQuery.sizeOf(context).width * .8,
          color: AppColor.accent.withOpacity(.125),
        ),
        DotWidget(
          width: 24,
          height: 24,
          top: MediaQuery.sizeOf(context).height * .5,
          left: MediaQuery.sizeOf(context).width * .1,
          color: AppColor.accent.withOpacity(.125),
        ),
        DotWidget(
          width: 20,
          height: 20,
          top: MediaQuery.sizeOf(context).height * .375,
          left: MediaQuery.sizeOf(context).width * .8,
          color: AppColor.accent.withOpacity(.125),
        ),
        DotWidget(
          width: 40,
          height: 40,
          top: MediaQuery.sizeOf(context).height * .25,
          left: MediaQuery.sizeOf(context).width * .1,
          color: AppColor.accent.withOpacity(.125),
        ),
        DotWidget(
          width: 16,
          height: 16,
          top: MediaQuery.sizeOf(context).height * .625,
          left: MediaQuery.sizeOf(context).width * .4,
          color: AppColor.accent.withOpacity(.125),
        ),
      ],
    );
  }
}
