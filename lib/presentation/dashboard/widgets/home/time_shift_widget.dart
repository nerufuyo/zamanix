import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';

class TimeShiftWidget extends StatelessWidget {
  const TimeShiftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.accent,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        '09:00 - 18:00',
        style: AppTextStyle.h4.copyWith(
          color: AppColor.textDark,
        ),
      ),
    );
  }
}
