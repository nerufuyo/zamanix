import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:zamanix/firebase_options.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/presentation/dashboard/bloc/location/location_bloc.dart';
import 'package:zamanix/presentation/dashboard/bloc/timezone/timezone_bloc.dart';
import 'package:zamanix/presentation/dashboard/bloc/user/user_bloc.dart';
import 'package:zamanix/repositories/authentication_repository.dart';
import 'package:zamanix/repositories/user_repository.dart';
import 'package:zamanix/utils/app_local_storage.dart';
import 'package:zamanix/utils/app_location_service.dart';
import 'package:zamanix/utils/app_timezone.dart';

final GetIt getIt = GetIt.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
const FlutterSecureStorage secureStorage = FlutterSecureStorage();
final AppLocalStorage localStorage = AppLocalStorage();

Future<void> setup() async {
  await _initializeFirebase();
  _injectDependency();
}

Future<void> _initializeFirebase() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Register Firebase services as singletons
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<AppLocalStorage>(AppLocalStorage());
}

void _injectDependency() {
  // Register repositories and blocs
  getIt
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl())
    ..registerLazySingleton<AppLocationService>(() => AppLocationService())
    ..registerLazySingleton<AppTimezone>(() => AppTimezone())
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl())
    ..registerFactory(
        () => AuthenticationBloc(getIt<AuthenticationRepository>()))
    ..registerFactory(() => LocationBloc(getIt<AppLocationService>()))
    ..registerFactory(() => TimezoneBloc())
    ..registerFactory(() => UserBloc(getIt<UserRepository>()));
}
