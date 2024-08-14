import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/repositories/models/user_model.dart';

class ProfileQuickInfoWidget extends StatelessWidget {
  const ProfileQuickInfoWidget({
    super.key,
    required this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userModel?.fullname ?? '',
          style: AppTextStyle.h5.copyWith(
            color: AppColor.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          userModel?.employment?.jobPosition ?? '',
          style: AppTextStyle.body2.copyWith(
            color: AppColor.textLight,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Edit Profile',
            style: AppTextStyle.body2.copyWith(
              color: AppColor.info,
            ),
          ),
        ),
      ],
    );
  }
}
