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
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    BlocProvider.of<AuthenticationBloc>(context).add(CheckAuthentication());
    Future.delayed(
      const Duration(seconds: 3),
      () {
        final state = BlocProvider.of<AuthenticationBloc>(context).state;
        bool isAuth = state is AuthenticationAuthenticated;

        if (isAuth) {
          AppRoute.navigateTo(context, AppRoute.dashboard);
        } else {
          AppRoute.navigateTo(context, AppRoute.auth);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: LottieBuilder.asset(
            AppAnimation.appLogoAnimation,
            width: MediaQuery.of(context).size.width * .75,
            frameRate: FrameRate.max,
          ),
        ),
      ),
    );
  }
}
