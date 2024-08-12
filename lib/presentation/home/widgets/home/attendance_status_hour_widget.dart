import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/constant.dart';
import 'package:zamanix/utils/spacing_list.dart';

class AttendanceHourStatusWidget extends StatelessWidget {
  const AttendanceHourStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: clockItems.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            clockItems[index]['logo']!,
            width: 24,
            height: 24,
          ),
          Text(
            '- : -',
            style: AppTextStyle.h6.copyWith(
              color: AppColor.textLight,
            ),
          ),
          Text(
            clockItems[index]['label']!,
            style: AppTextStyle.caption.copyWith(
              color: AppColor.textLight,
            ),
          ),
        ].withSpacing(16),
      ),
    );
  }
}
