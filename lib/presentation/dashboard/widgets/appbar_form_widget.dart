import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';

class AppBarForm extends StatelessWidget {
  const AppBarForm({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.accent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(title, style: AppTextStyle.h5),
    );
  }
}
