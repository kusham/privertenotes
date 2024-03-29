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
    apiKey: 'AIzaSyD62gWHEIenZFeQryietGYbdDyAGVVuD6U',
    appId: '1:418206900985:web:d4a2d46a00be47052db828',
    messagingSenderId: '418206900985',
    projectId: 'my-private-notes-2532a',
    authDomain: 'my-private-notes-2532a.firebaseapp.com',
    storageBucket: 'my-private-notes-2532a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB44lIKYFlw0wxdTt8UnhUhngTg9crESCk',
    appId: '1:418206900985:android:8b7b1dc630be29962db828',
    messagingSenderId: '418206900985',
    projectId: 'my-private-notes-2532a',
    storageBucket: 'my-private-notes-2532a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXYhY7_-ldwzMDwz0ITURvl6kOK83oCOU',
    appId: '1:418206900985:ios:03ba7de8dd811ce82db828',
    messagingSenderId: '418206900985',
    projectId: 'my-private-notes-2532a',
    storageBucket: 'my-private-notes-2532a.appspot.com',
    iosClientId: '418206900985-oqgoviadm6hbjt0thnv2at3jea117a62.apps.googleusercontent.com',
    iosBundleId: 'com.makingapp.privertenotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXYhY7_-ldwzMDwz0ITURvl6kOK83oCOU',
    appId: '1:418206900985:ios:03ba7de8dd811ce82db828',
    messagingSenderId: '418206900985',
    projectId: 'my-private-notes-2532a',
    storageBucket: 'my-private-notes-2532a.appspot.com',
    iosClientId: '418206900985-oqgoviadm6hbjt0thnv2at3jea117a62.apps.googleusercontent.com',
    iosBundleId: 'com.makingapp.privertenotes',
  );
}
