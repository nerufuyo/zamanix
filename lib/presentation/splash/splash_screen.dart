import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context).add(CheckAuthentication());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationInitial) {
              Future.delayed(
                const Duration(seconds: 3),
                () => AppRoute.navigateTo(context, AppRoute.auth),
              );
            }

            if (state is AuthenticationSuccess) {
              Future.delayed(
                const Duration(seconds: 3),
                () => AppRoute.navigateTo(context, AppRoute.home),
              );
            }
          },
          child: Center(
            child: LottieBuilder.asset(
              AppAnimation.appLogoAnimation,
              width: MediaQuery.of(context).size.width * .75,
              frameRate: FrameRate.max,
            ),
          ),
        ),
      ),
    );
  }
}
