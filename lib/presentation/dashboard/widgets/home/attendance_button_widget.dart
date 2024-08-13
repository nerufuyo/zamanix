import 'package:flutter/material.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/spacing_list.dart';

class AttendanceButtonWidget extends StatelessWidget {
  const AttendanceButtonWidget({
    super.key,
    required this.isClockIn,
    required this.isClockInAction,
  });

  final bool isClockIn;
  final void Function() isClockInAction;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => isClockInAction(),
      splashRadius: MediaQuery.sizeOf(context).width * 0.325,
      iconSize: 240,
      icon: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isClockIn
                  ? AppColor.error.withOpacity(.4)
                  : AppColor.success.withOpacity(.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0 - 4, 16),
            ),
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: !isClockIn
                ? [
                    AppColor.success,
                    AppColor.success.withOpacity(.5),
                    AppColor.success.withOpacity(.75)
                  ]
                : [
                    AppColor.error,
                    AppColor.error.withOpacity(.5),
                    AppColor.error.withOpacity(.75)
                  ],
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AppImage.appClockInLogo,
                width: 120,
                height: 120,
              ),
            ),
            Text(
              isClockIn ? 'Clock Out' : 'Clock In',
              style: AppTextStyle.h3.copyWith(
                color: AppColor.backgroundLight,
              ),
            ),
          ].withSpacing(8),
        ),
      ),
    );
  }
}
