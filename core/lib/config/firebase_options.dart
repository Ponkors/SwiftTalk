// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAvNV-nQR7N6tS4eqyTWgRLhSd_vbIeq7I',
    appId: '1:102935724771:web:900c918cdf98aae3ad3bd6',
    messagingSenderId: '102935724771',
    projectId: 'swifttalk-5757d',
    authDomain: 'swifttalk-5757d.firebaseapp.com',
    storageBucket: 'swifttalk-5757d.appspot.com',
    measurementId: 'G-V2THT05BE6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDudgYCYV33EEttJ05SPOKil_EH7INRqSY',
    appId: '1:102935724771:android:b29d5f4fca1f437aad3bd6',
    messagingSenderId: '102935724771',
    projectId: 'swifttalk-5757d',
    storageBucket: 'swifttalk-5757d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQXoH5KlPIdPI-6o7NGnfBU1soEjs77VM',
    appId: '1:102935724771:ios:3ae4574dd81dde8ead3bd6',
    messagingSenderId: '102935724771',
    projectId: 'swifttalk-5757d',
    storageBucket: 'swifttalk-5757d.appspot.com',
    iosBundleId: 'com.example.swiftTalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQXoH5KlPIdPI-6o7NGnfBU1soEjs77VM',
    appId: '1:102935724771:ios:57c16be14a163cbaad3bd6',
    messagingSenderId: '102935724771',
    projectId: 'swifttalk-5757d',
    storageBucket: 'swifttalk-5757d.appspot.com',
    iosBundleId: 'com.example.swiftTalk.RunnerTests',
  );
}
