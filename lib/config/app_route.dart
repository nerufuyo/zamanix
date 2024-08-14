import 'package:flutter/material.dart';
import 'package:zamanix/presentation/authentication/authentication_screen.dart';
import 'package:zamanix/presentation/dashboard/attendance_verification_screen.dart';
import 'package:zamanix/presentation/dashboard/dashboard_screen.dart';
import 'package:zamanix/presentation/dashboard/edit_profile_screen.dart';
import 'package:zamanix/presentation/empty/empty_screen.dart';
import 'package:zamanix/presentation/splash/splash_screen.dart';

class AppRoute {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String dashboard = '/dashboard';
  static const String attendanceVerification = '/attendanceVerification';
  static const String editProfile = '/editProfile';
  static const String empty = '/empty';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case attendanceVerification:
        return MaterialPageRoute(
          builder: (_) => const AttendanceVerificationScreen(),
        );
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

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
