// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBpqNkWpistmMWKrphcXTCyA4NGjkLMQQ8',
    appId: '1:769792665766:web:018ec642b0865e9ef52c67',
    messagingSenderId: '769792665766',
    projectId: 'zamanix-94260',
    authDomain: 'zamanix-94260.firebaseapp.com',
    storageBucket: 'zamanix-94260.appspot.com',
    measurementId: 'G-ZRWX37YD8V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqdDyDqHdI9XG7J9T39F3VyoatOD0pQdM',
    appId: '1:769792665766:android:951715fd2a8dc940f52c67',
    messagingSenderId: '769792665766',
    projectId: 'zamanix-94260',
    storageBucket: 'zamanix-94260.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDG-x_vs3hz9UR9eP50ylv5WfQzi1PRNOU',
    appId: '1:769792665766:ios:bf1aba47ec76f9aef52c67',
    messagingSenderId: '769792665766',
    projectId: 'zamanix-94260',
    storageBucket: 'zamanix-94260.appspot.com',
    iosBundleId: 'com.example.zamanix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDG-x_vs3hz9UR9eP50ylv5WfQzi1PRNOU',
    appId: '1:769792665766:ios:bf1aba47ec76f9aef52c67',
    messagingSenderId: '769792665766',
    projectId: 'zamanix-94260',
    storageBucket: 'zamanix-94260.appspot.com',
    iosBundleId: 'com.example.zamanix',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBpqNkWpistmMWKrphcXTCyA4NGjkLMQQ8',
    appId: '1:769792665766:web:6c7d50673cded66df52c67',
    messagingSenderId: '769792665766',
    projectId: 'zamanix-94260',
    authDomain: 'zamanix-94260.firebaseapp.com',
    storageBucket: 'zamanix-94260.appspot.com',
    measurementId: 'G-DTW8HCSQP3',
  );
}
