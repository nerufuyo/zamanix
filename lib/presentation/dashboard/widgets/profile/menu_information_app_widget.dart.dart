import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/utils/constant.dart';
import 'package:zamanix/utils/popup_dialog.dart';
import 'package:zamanix/utils/spacing_list.dart';

class MenuInformationAppWidget extends StatelessWidget {
  const MenuInformationAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: optionItemMenus.length,
      itemBuilder: (context, index) => ListTile(
        dense: true,
        tileColor: index == 0 ? AppColor.textDark : AppColor.error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Image.asset(
          optionItemMenus[index]['icon'].toString(),
          width: 20,
        ),
        title: Text(
          optionItemMenus[index]['label'].toString(),
          style: AppTextStyle.body2.copyWith(
            color: index == 0 ? AppColor.textLight : Colors.white,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: index == 0 ? AppColor.accent : Colors.white,
        ),
        onTap: () {
          if (index == 0) {
            // Navigator.pushNamed(context, optionItemMenus[index]['route'].toString());
          } else {
            PopUpDialog.showConfirmationDialog(
              context,
              AppAnimation.appWarningAnimation,
              'Are you sure you want to sign out?',
              () {
                context.read<AuthenticationBloc>().add(SignOut());
                AppRoute.navigateTo(context, AppRoute.auth);
              },
              () => PopUpDialog.closeDialog(context),
            );
          }
        },
      ),
    );
  }
}
