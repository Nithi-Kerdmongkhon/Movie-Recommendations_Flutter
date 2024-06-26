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
    apiKey: 'AIzaSyDJ-Ou59FiAGpFLPtDF3kOFBWO5YUSgeZU',
    appId: '1:626773354081:web:b064c7a879c95386116c20',
    messagingSenderId: '626773354081',
    projectId: 'project-a2187',
    authDomain: 'project-a2187.firebaseapp.com',
    storageBucket: 'project-a2187.appspot.com',
    measurementId: 'G-V8694XNBT8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDI2Ob5HpFj-_U1DmdLZiy6c9MTZp2I6uM',
    appId: '1:626773354081:android:b45e3f490cd4126c116c20',
    messagingSenderId: '626773354081',
    projectId: 'project-a2187',
    storageBucket: 'project-a2187.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhtlHLtyamVzLHHrw40tbhZ3p2CB1SF3s',
    appId: '1:626773354081:ios:2c5bfd9b8b554170116c20',
    messagingSenderId: '626773354081',
    projectId: 'project-a2187',
    storageBucket: 'project-a2187.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhtlHLtyamVzLHHrw40tbhZ3p2CB1SF3s',
    appId: '1:626773354081:ios:7090d4cf2d0bdc87116c20',
    messagingSenderId: '626773354081',
    projectId: 'project-a2187',
    storageBucket: 'project-a2187.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}
