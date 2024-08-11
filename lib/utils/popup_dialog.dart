import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/spacing_list.dart';

class PopUpDialog {
  static bool _isDialogShowing = false;

  static void showAnimatedPopUpDialog(
    BuildContext context,
    String lottieAsset,
    String message,
  ) {
    if (_isDialogShowing) return;

    _isDialogShowing = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottieAsset,
                width: 200,
                height: 200,
                repeat: false,
              ),
              Text(
                message,
                style: AppTextStyle.h5.copyWith(
                  color: AppColor.error,
                ),
                textAlign: TextAlign.center,
              ),
            ].withSpacing(16),
          ),
        ),
      ),
    ).then((_) {
      _isDialogShowing = false;
    });
  }

  static void closeDialog(BuildContext context) {
    if (_isDialogShowing) {
      Navigator.of(context).pop();
      _isDialogShowing = false;
    }
  }
}
