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
    apiKey: 'AIzaSyAA0mSjqMmwateRPox2dBeB6n3NgaN3eB0',
    appId: '1:678761285840:web:26525133081567f4abb6d5',
    messagingSenderId: '678761285840',
    projectId: 'gym-app-87235',
    authDomain: 'gym-app-87235.firebaseapp.com',
    storageBucket: 'gym-app-87235.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDT1Uo5LpJTMH02HqL7jqQAG4pcmgx5Hc',
    appId: '1:678761285840:android:79342f1b0a8a9269abb6d5',
    messagingSenderId: '678761285840',
    projectId: 'gym-app-87235',
    storageBucket: 'gym-app-87235.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKpgAIK01o7QwchtjqzEO6M8MXN0rSKgU',
    appId: '1:678761285840:ios:6dab4de9efcd6ca7abb6d5',
    messagingSenderId: '678761285840',
    projectId: 'gym-app-87235',
    storageBucket: 'gym-app-87235.firebasestorage.app',
    iosClientId: '678761285840-3n1sh30paskoo7couuid2fnr60dlu23m.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectGainglory',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKpgAIK01o7QwchtjqzEO6M8MXN0rSKgU',
    appId: '1:678761285840:ios:6dab4de9efcd6ca7abb6d5',
    messagingSenderId: '678761285840',
    projectId: 'gym-app-87235',
    storageBucket: 'gym-app-87235.firebasestorage.app',
    iosClientId: '678761285840-3n1sh30paskoo7couuid2fnr60dlu23m.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectGainglory',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAA0mSjqMmwateRPox2dBeB6n3NgaN3eB0',
    appId: '1:678761285840:web:b78d06afb4a7a3ffabb6d5',
    messagingSenderId: '678761285840',
    projectId: 'gym-app-87235',
    authDomain: 'gym-app-87235.firebaseapp.com',
    storageBucket: 'gym-app-87235.firebasestorage.app',
  );

}