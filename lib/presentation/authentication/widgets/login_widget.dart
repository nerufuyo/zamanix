import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/constant.dart';
import 'package:zamanix/utils/validation_check.dart';

class LoginWidget extends StatelessWidget {
  final List<TextEditingController> controller;
  const LoginWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Filter the authItems list to only include 'Email' and 'Password'
    final List filteredAuthItems = authItems
        .where((item) => item == 'Email' || item == 'Password')
        .toList();

    // Create a list of TextEditingController based on the filteredAuthItems
    final List<TextEditingController> controllers =
        filteredAuthItems.map((item) => TextEditingController()).toList();

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredAuthItems.length,
      itemBuilder: (context, index) => TextFormField(
        controller: controllers[index],
        decoration: InputDecoration(
          errorStyle: AppTextStyle.body1.copyWith(color: AppColor.error),
          labelText: filteredAuthItems[index],
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
        obscureText: filteredAuthItems[index] == 'Password',
        validator: (value) => filteredAuthItems[index] == 'Email'
            ? ValidationCheck.checkEmail(value!)
            : ValidationCheck.checkPassword(value!),
      ),
    );
  }
}
