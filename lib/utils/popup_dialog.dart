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
}
