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
    apiKey: 'AIzaSyBk5WGgnwTYQKTj161X0Lpt65At0gSixoE',
    appId: '1:1066124948551:web:86ef650ddceeac4239ad62',
    messagingSenderId: '1066124948551',
    projectId: 'wishwash-8e62c',
    authDomain: 'wishwash-8e62c.firebaseapp.com',
    storageBucket: 'wishwash-8e62c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBJdtMzzZhGo_Z_RJFVPdX68-noLTYA60',
    appId: '1:1066124948551:android:ac16896c60b2c91f39ad62',
    messagingSenderId: '1066124948551',
    projectId: 'wishwash-8e62c',
    storageBucket: 'wishwash-8e62c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAXJMgJZn4P0mK8h1o9kN_kCsMsLcM0a4',
    appId: '1:1066124948551:ios:af9e97d098afff6139ad62',
    messagingSenderId: '1066124948551',
    projectId: 'wishwash-8e62c',
    storageBucket: 'wishwash-8e62c.appspot.com',
    iosClientId: '1066124948551-ij6rtqd4mvurmcveoejrkcqm7ot1eaut.apps.googleusercontent.com',
    iosBundleId: 'com.example.navi2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAXJMgJZn4P0mK8h1o9kN_kCsMsLcM0a4',
    appId: '1:1066124948551:ios:98e5171280efe69e39ad62',
    messagingSenderId: '1066124948551',
    projectId: 'wishwash-8e62c',
    storageBucket: 'wishwash-8e62c.appspot.com',
    iosClientId: '1066124948551-pc88tpt1gc1al00hlhpavqsgttjtnckj.apps.googleusercontent.com',
    iosBundleId: 'com.example.navi2.RunnerTests',
  );
}
