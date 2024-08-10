import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoute.splash,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
