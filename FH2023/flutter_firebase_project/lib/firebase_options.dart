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
    apiKey: 'AIzaSyBe8apHFo-838Eu4DwFkPYPJon1kepHPBE',
    appId: '1:1018687040783:web:93ef4320ddacbd89dc627a',
    messagingSenderId: '1018687040783',
    projectId: 'muhapp-1c94e',
    authDomain: 'muhapp-1c94e.firebaseapp.com',
    storageBucket: 'muhapp-1c94e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfoQnSZRgaXpFeTq50YjnUk3LFhlyGBlo',
    appId: '1:1018687040783:android:cba6f2b37337fdb3dc627a',
    messagingSenderId: '1018687040783',
    projectId: 'muhapp-1c94e',
    storageBucket: 'muhapp-1c94e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3N9W8rVQWgwOdVF6-q1uzhBbdwavYdGY',
    appId: '1:1018687040783:ios:87a04d8f0829c25ddc627a',
    messagingSenderId: '1018687040783',
    projectId: 'muhapp-1c94e',
    storageBucket: 'muhapp-1c94e.appspot.com',
    iosClientId: '1018687040783-m009i3bta3fgnbp3j5qhb3q1m6o9hf92.apps.googleusercontent.com',
    iosBundleId: 'com.erkanozturk1903.flutterFirebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3N9W8rVQWgwOdVF6-q1uzhBbdwavYdGY',
    appId: '1:1018687040783:ios:6d4ba7298604d663dc627a',
    messagingSenderId: '1018687040783',
    projectId: 'muhapp-1c94e',
    storageBucket: 'muhapp-1c94e.appspot.com',
    iosClientId: '1018687040783-8tchhtphj109ug7d450pam0pfepeul6e.apps.googleusercontent.com',
    iosBundleId: 'com.erkanozturk1903.flutterFirebaseProject.RunnerTests',
  );
}
