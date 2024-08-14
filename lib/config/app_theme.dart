import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFF2C2C2C);
  static const Color accent = Color(0xFF4A4A4A);
  static const Color highlight = Color(0xFFC0C0C0);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color textLight = Color(0xFF2D2D2D);
  static const Color textDark = Color(0xFFE0E0E0);

  static const Color transparent = Colors.transparent;

  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF1976D2);
  static const Color success = Color(0xFF388E3C);
}

class AppFontSize {
  static const double h1 = 32;
  static const double h2 = 24;
  static const double h3 = 20;
  static const double h4 = 18;
  static const double h5 = 16;
  static const double h6 = 14;
  static const double h7 = 12;

  static const double body1 = 16;
  static const double body2 = 14;
  static const double body3 = 12;

  static const double button = 16;

  static const double caption = 12;

  static const double overline = 10;

  static const double subtitle1 = 16;

  static const double subtitle2 = 14;

  static const double subtitle3 = 12;

  static const double subtitle4 = 10;

  static const double subtitle5 = 8;

  static const double subtitle6 = 6;

  static const double subtitle7 = 4;

  static const double subtitle8 = 2;
}

class AppFontStyle {
  static const String regular = 'assets/fonts/Nunito-Regular.ttf';
  static const String medium = 'assets/fonts/Nunito-Medium.ttf';
  static const String bold = 'assets/fonts/Nunito-Bold.ttf';
  static const String italic = 'assets/fonts/Nunito-Italic.ttf';
  static const String light = 'assets/fonts/Nunito-Light.ttf';
  static const String thin = 'assets/fonts/Nunito-Thin.ttf';
  static const String extraLight = 'assets/fonts/Nunito-ExtraLight.ttf';
  static const String semiBold = 'assets/fonts/Nunito-SemiBold.ttf';
  static const String extraBold = 'assets/fonts/Nunito-ExtraBold.ttf';
  static const String black = 'assets/fonts/Nunito-Black.ttf';

  static const String defaultFont = regular;
}

class AppFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight italic = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight thin = FontWeight.w200;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class AppTextStyle {
  static const TextStyle h1 = TextStyle(
    fontSize: AppFontSize.h1,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: AppFontSize.h2,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: AppFontSize.h3,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: AppFontSize.h4,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: AppFontSize.h5,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: AppFontSize.h6,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle h7 = TextStyle(
    fontSize: AppFontSize.h7,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: AppFontSize.body1,
    fontWeight: AppFontWeight.regular,
    fontFamily: AppFontStyle.regular,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: AppFontSize.body2,
    fontWeight: AppFontWeight.regular,
    fontFamily: AppFontStyle.regular,
  );

  static const TextStyle body3 = TextStyle(
    fontSize: AppFontSize.body3,
    fontWeight: AppFontWeight.regular,
    fontFamily: AppFontStyle.regular,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontSize.button,
    fontWeight: AppFontWeight.bold,
    fontFamily: AppFontStyle.bold,
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppFontSize.caption,
    fontWeight: AppFontWeight.regular,
    fontFamily: AppFontStyle.regular,
  );

  static const TextStyle overline = TextStyle(
    fontSize: AppFontSize.overline,
    fontWeight: AppFontWeight.regular,
    fontFamily: AppFontStyle.regular,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: AppFontSize.subtitle1,
    fontWeight: AppFontWeight.regular,
    fontFamily: AppFontStyle.regular,
  );
}

class AppTheme {
// Light Mode Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.backgroundLight,
    textTheme: const TextTheme(
      displayLarge: AppTextStyle.h1,
      displayMedium: AppTextStyle.h2,
      displaySmall: AppTextStyle.h3,
      headlineMedium: AppTextStyle.h4,
      headlineSmall: AppTextStyle.h5,
      titleLarge: AppTextStyle.h6,
      bodyLarge: AppTextStyle.body1,
      bodyMedium: AppTextStyle.body2,
      labelLarge: AppTextStyle.button,
      bodySmall: AppTextStyle.caption,
      labelSmall: AppTextStyle.overline,
      titleMedium: AppTextStyle.subtitle1,
    ),
  );

  // Dark Mode Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.backgroundDark,
    textTheme: const TextTheme(
      displayLarge: AppTextStyle.h1,
      displayMedium: AppTextStyle.h2,
      displaySmall: AppTextStyle.h3,
      headlineMedium: AppTextStyle.h4,
      headlineSmall: AppTextStyle.h5,
      titleLarge: AppTextStyle.h6,
      bodyLarge: AppTextStyle.body1,
      bodyMedium: AppTextStyle.body2,
      labelLarge: AppTextStyle.button,
      bodySmall: AppTextStyle.caption,
      labelSmall: AppTextStyle.overline,
      titleMedium: AppTextStyle.subtitle1,
    ),
  );
}
