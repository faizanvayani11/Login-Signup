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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB5OO1_I-OKD65xPOF19b2SKnA-gQbZBms',
    appId: '1:375050522307:web:8aef0103cb67dbab6e5c76',
    messagingSenderId: '375050522307',
    projectId: 'class15-practice',
    authDomain: 'class15-practice.firebaseapp.com',
    storageBucket: 'class15-practice.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOrCITWHp678jbOXe2ipq6GQk5nsAXDkM',
    appId: '1:375050522307:android:0764517006ebc7f06e5c76',
    messagingSenderId: '375050522307',
    projectId: 'class15-practice',
    storageBucket: 'class15-practice.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdyCfshh3cU69woOZQEoI5Lp4wuK6GmBs',
    appId: '1:375050522307:ios:5c8776a9770f7bc16e5c76',
    messagingSenderId: '375050522307',
    projectId: 'class15-practice',
    storageBucket: 'class15-practice.appspot.com',
    iosBundleId: 'com.example.class15',
  );
}