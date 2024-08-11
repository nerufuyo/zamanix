import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:zamanix/firebase_options.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/repositories/authentication_repository.dart';
import 'package:zamanix/utils/local_storage.dart';

final GetIt getIt = GetIt.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
const FlutterSecureStorage secureStorage = FlutterSecureStorage();
final LocalStorage localStorage = LocalStorage();

void setup() async {
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
    ..registerFactory(() => AuthenticationBloc(getIt()));
}
