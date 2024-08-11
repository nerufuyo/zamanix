import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:zamanix/firebase_options.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/presentation/home/bloc/location/location_bloc.dart';
import 'package:zamanix/presentation/home/bloc/timezone/timezone_bloc.dart';
import 'package:zamanix/repositories/authentication_repository.dart';
import 'package:zamanix/utils/local_storage.dart';
import 'package:zamanix/utils/location_service.dart';
import 'package:zamanix/utils/timezone.dart';

final GetIt getIt = GetIt.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
const FlutterSecureStorage secureStorage = FlutterSecureStorage();
final LocalStorage localStorage = LocalStorage();

Future<void> setup() async {
  await _initializeFirebase();
  _injectDependency();
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Register Firebase services as singletons
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<LocalStorage>(LocalStorage());
}

void _injectDependency() {
  // Register repositories and blocs
  getIt
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl())
    ..registerLazySingleton<LocationService>(() => LocationService())
    ..registerLazySingleton<Timezone>(() => Timezone())
    ..registerFactory(
        () => AuthenticationBloc(getIt<AuthenticationRepository>()))
    ..registerFactory(() => LocationBloc(getIt<LocationService>()))
    ..registerFactory(() => TimezoneBloc());
}
