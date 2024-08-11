import 'package:flutter/material.dart';
import 'package:zamanix/presentation/authentication/authentication_screen.dart';
import 'package:zamanix/presentation/empty/empty_screen.dart';
import 'package:zamanix/presentation/home/home_screen.dart';
import 'package:zamanix/presentation/splash/splash_screen.dart';

class AppRoute {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String empty = '/empty';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => EmptyScreen());
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
