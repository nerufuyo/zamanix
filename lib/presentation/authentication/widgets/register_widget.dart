import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/constant.dart';
import 'package:zamanix/utils/validation_check.dart';

class RegisterWidget extends StatelessWidget {
  final List<TextEditingController> controller;
  const RegisterWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: authItems.length,
      itemBuilder: (context, index) => TextFormField(
        controller: controller[index],
        decoration: InputDecoration(
          errorStyle: AppTextStyle.body1.copyWith(color: AppColor.error),
          labelText: authItems[index],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.accent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.error),
          ),
        ),
        obscureText: authItems[index] == 'Password' ||
            authItems[index] == 'Confirm Password',
        validator: (value) {
          switch (authItems[index]) {
            case 'Full Name':
              return ValidationCheck.checkFullName(value!);
            case 'Username':
              return ValidationCheck.checkUsername(value!);
            case 'Email':
              return ValidationCheck.checkEmail(value!);
            case 'Password':
              return ValidationCheck.checkPassword(value!);
            case 'Confirm Password':
              return ValidationCheck.checkConfirmPassword(
                value!,
                controller[authItems.indexOf('Password')].text,
              );
          }

          return null;
        },
      ),
    );
  }
}
