import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToOtherScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () => AppRoute.navigateTo(context, AppRoute.auth),
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToOtherScreen();
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
