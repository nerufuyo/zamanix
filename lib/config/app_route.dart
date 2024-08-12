import 'package:flutter/material.dart';
import 'package:zamanix/presentation/authentication/authentication_screen.dart';
import 'package:zamanix/presentation/empty/empty_screen.dart';
import 'package:zamanix/presentation/home/dashboard_screen.dart';
import 'package:zamanix/presentation/home/verification_location_screen.dart';
import 'package:zamanix/presentation/splash/splash_screen.dart';

class AppRoute {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String dashboard = '/dashboard';
  static const String verificationMap = '/verificationMap';
  static const String empty = '/empty';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case verificationMap:
        return MaterialPageRoute(builder: (_) => const VerificationMapScreen());
      default:
        return MaterialPageRoute(builder: (_) => const EmptyScreen());
    }
  }

  static void navigateTo(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }
}
