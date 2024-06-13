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
    apiKey: 'AIzaSyC0JBmFqREsnkG_mveN62FibRzWltJ3OsI',
    appId: '1:979740880375:web:2269bff4f53a6e4f0812f2',
    messagingSenderId: '979740880375',
    projectId: 'farmarket-8d846',
    authDomain: 'farmarket-8d846.firebaseapp.com',
    databaseURL: 'https://farmarket-8d846-default-rtdb.firebaseio.com',
    storageBucket: 'farmarket-8d846.appspot.com',
    measurementId: 'G-15BBP0TRLZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQDYEJd1HTjnWF5YpKXmyAUbv_Fr_o43k',
    appId: '1:979740880375:android:9382f6e803392b490812f2',
    messagingSenderId: '979740880375',
    projectId: 'farmarket-8d846',
    databaseURL: 'https://farmarket-8d846-default-rtdb.firebaseio.com',
    storageBucket: 'farmarket-8d846.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCq3jCxWVsUjYc9qZMrNQXw_PQqC6FIHfE',
    appId: '1:979740880375:ios:18ed83414ca957f10812f2',
    messagingSenderId: '979740880375',
    projectId: 'farmarket-8d846',
    databaseURL: 'https://farmarket-8d846-default-rtdb.firebaseio.com',
    storageBucket: 'farmarket-8d846.appspot.com',
    iosBundleId: 'com.example.farmboost',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCq3jCxWVsUjYc9qZMrNQXw_PQqC6FIHfE',
    appId: '1:979740880375:ios:18ed83414ca957f10812f2',
    messagingSenderId: '979740880375',
    projectId: 'farmarket-8d846',
    databaseURL: 'https://farmarket-8d846-default-rtdb.firebaseio.com',
    storageBucket: 'farmarket-8d846.appspot.com',
    iosBundleId: 'com.example.farmboost',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0JBmFqREsnkG_mveN62FibRzWltJ3OsI',
    appId: '1:979740880375:web:a995b7c3645512520812f2',
    messagingSenderId: '979740880375',
    projectId: 'farmarket-8d846',
    authDomain: 'farmarket-8d846.firebaseapp.com',
    databaseURL: 'https://farmarket-8d846-default-rtdb.firebaseio.com',
    storageBucket: 'farmarket-8d846.appspot.com',
    measurementId: 'G-WB3KD79JVL',
  );
}