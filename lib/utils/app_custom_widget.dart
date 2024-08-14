import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/utils/app_spacing_list.dart';

class AppCustomWidget {
  static bool _isDialogShowing = false;

  // Show a pop-up dialog with a Lottie animation
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

  // Show a confirmation dialog with a Lottie animation
  static void showConfirmationDialog(
    BuildContext context,
    String lottieAsset,
    String message,
    Function onYes,
    Function onNo,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              lottieAsset,
              repeat: false,
              width: 120,
            ),
            Text(
              message,
              style: AppTextStyle.h4,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                2,
                (index) => SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (index == 0) {
                        onNo();
                      } else {
                        onYes();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          index == 0 ? AppColor.textDark : AppColor.error,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      index == 0 ? 'No' : 'Yes',
                      style: AppTextStyle.body2.copyWith(
                        color:
                            index == 0 ? AppColor.textLight : AppColor.textDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ].withSpacing(4),
        ),
      ),
    );
  }

  // Close the dialog
  static void closeDialog(BuildContext context) {
    if (_isDialogShowing) {
      Navigator.of(context).pop();
      _isDialogShowing = false;
    }
  }

  // Show a maintenance screen
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

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
    bool? enabled,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled ?? true,
      decoration: InputDecoration(
        errorStyle: AppTextStyle.body3.copyWith(color: AppColor.error),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
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
      validator: validator,
    );
  }
}
