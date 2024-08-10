import 'package:flutter/material.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/authentication/widgets/gap_widget.dart';
import 'package:zamanix/presentation/authentication/widgets/login_widget.dart';
import 'package:zamanix/presentation/authentication/widgets/option_widget.dart';
import 'package:zamanix/presentation/authentication/widgets/register_widget.dart';
import 'package:zamanix/utils/constant.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(
    authItems.length,
    (index) => TextEditingController(),
  );

  bool isRegister = false;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 24,
            top: isRegister
                ? MediaQuery.sizeOf(context).height * .125
                : MediaQuery.sizeOf(context).height * .25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: Image.asset(
                  AppImage.logo,
                  width: MediaQuery.sizeOf(context).width * .75,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isRegister
                        ? RegisterWidget(controller: _controllers)
                        : LoginWidget(controller: _controllers),
                    OptionWidget(
                      isRegister: isRegister,
                      isRememberMeValue: isRememberMe,
                      isRememberMe: (value) =>
                          setState(() => isRememberMe = value),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.accent,
                        foregroundColor: AppColor.backgroundLight,
                        splashFactory: InkRipple.splashFactory,
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width,
                          48,
                        ),
                      ),
                      child: Text(isRegister ? 'Register' : 'Login'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isRegister
                              ? 'Already have an account?'
                              : 'Don\'t have an account?',
                          style: AppTextStyle.body2,
                        ),
                        TextButton(
                          onPressed: () =>
                              setState(() => isRegister = !isRegister),
                          child: Text(
                            isRegister ? 'Login' : 'Register',
                            style: AppTextStyle.h6.copyWith(
                              color: AppColor.info,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].withSpacing(16),
                ),
              ),
              Text(
                AppConfig.appCopyRight,
                style: AppTextStyle.caption.copyWith(
                  color: AppColor.textLight.withOpacity(.75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
