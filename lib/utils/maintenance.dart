import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/spacing_list.dart';

class Maintenance {
  Widget buildMaintenanceScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(AppAnimation.appMaintenanceAnimation),
          const Text('Under Maintenance!', style: AppTextStyle.h3),
          Text(
            'We are currently under maintenance. Please check back later.',
            style: AppTextStyle.body2.copyWith(
              color: AppColor.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ].withSpacing(16),
      ),
    );
  }
}
