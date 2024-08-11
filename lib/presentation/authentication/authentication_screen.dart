import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/presentation/authentication/widgets/login_widget.dart';
import 'package:zamanix/presentation/authentication/widgets/option_widget.dart';
import 'package:zamanix/presentation/authentication/widgets/register_widget.dart';
import 'package:zamanix/utils/constant.dart';
import 'package:zamanix/utils/popup_dialog.dart';
import 'package:zamanix/utils/spacing_list.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationLoading) {
              PopUpDialog.showAnimatedPopUpDialog(
                context,
                AppAnimation.appLoadingAnimation,
                isRegister ? 'Registering...' : 'Logging in...',
              );
            }

            if (state is AuthenticationSuccess) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  if (!isRegister) {
                    AppRoute.navigateTo(context, AppRoute.dashboard);
                  }
                  setState(() => isRegister = false);
                },
              );
              PopUpDialog.showAnimatedPopUpDialog(
                context,
                AppAnimation.appSuccessAnimation,
                isRegister ? 'Registration successful!' : 'Login successful!',
              );
            }
            if (state is AuthenticationFailure) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
              PopUpDialog.showAnimatedPopUpDialog(
                context,
                AppAnimation.appFailureAnimation,
                state.error,
              );
            }
          },
          child: Container(
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
                    AppImage.appLogo,
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(
                                  isRegister
                                      ? SignUpWithEmailAndPassword(
                                          fullname: _controllers[0].text,
                                          email: _controllers[1].text,
                                          password: _controllers[2].text,
                                        )
                                      : SignInWithEmailAndPassword(
                                          email: _controllers[1].text,
                                          password: _controllers[2].text,
                                        ),
                                );
                          }
                        },
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
      ),
    );
  }
}
