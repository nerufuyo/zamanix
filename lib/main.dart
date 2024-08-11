import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/inject_dependencies.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/presentation/home/bloc/location/location_bloc.dart';
import 'package:zamanix/presentation/home/bloc/timezone/timezone_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
        BlocProvider(
            create: (context) => getIt<LocationBloc>()..add(GetLocation())),
        BlocProvider(create: (context) => getIt<TimezoneBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConfig.appName,
        // TODO: Implement Dark Theme
        theme: AppTheme.lightTheme,
        initialRoute: AppRoute.splash,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
