import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.isRegister,
    required this.isRememberMe,
    required this.isRememberMeValue,
  });

  final bool isRegister;
  final bool isRememberMeValue;
  final void Function(bool) isRememberMe;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isRegister,
      child: Row(
        children: [
          Checkbox(
            value: isRememberMeValue, // Use the boolean value here
            onChanged: (value) => isRememberMe(value!),
          ),
          const Text('Remember me', style: AppTextStyle.body2),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: AppTextStyle.h6.copyWith(
                color: AppColor.info,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
