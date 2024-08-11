import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:zamanix/firebase_options.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/repositories/authentication_repository.dart';

final GetIt getIt = GetIt.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

void setup() async {
  await initializeFirebase();
  injectDependency();
}

initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getIt.registerSingleton<FirebaseAuth>(firebaseAuth);
  getIt.registerSingleton<FirebaseFirestore>(db);
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
}

void injectDependency() {
  getIt
    ..registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(),
    )
    ..registerFactory(() => AuthenticationBloc(getIt()));
}
