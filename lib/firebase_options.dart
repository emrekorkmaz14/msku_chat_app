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
    apiKey: 'AIzaSyBR48Lfx-rbUDjn3suvC2GmQbfd61qqWaY',
    appId: '1:82682106403:web:0528b4ab10d116b3b65796',
    messagingSenderId: '82682106403',
    projectId: 'dbchatapp-aa944',
    authDomain: 'dbchatapp-aa944.firebaseapp.com',
    storageBucket: 'dbchatapp-aa944.appspot.com',
    measurementId: 'G-1XS0K3VLC0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDR1PCsWPBbFf9yoeiHFwGkHTCDh9rtPGA',
    appId: '1:82682106403:android:2c250b1fbec4d778b65796',
    messagingSenderId: '82682106403',
    projectId: 'dbchatapp-aa944',
    storageBucket: 'dbchatapp-aa944.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOGlkEz6BqnfhMEWqw_pdgvDS0Bne6MLU',
    appId: '1:82682106403:ios:bd67c8c09f3af1a5b65796',
    messagingSenderId: '82682106403',
    projectId: 'dbchatapp-aa944',
    storageBucket: 'dbchatapp-aa944.appspot.com',
    iosClientId: '82682106403-o6ngb0rjdvvb90mnur5urcf9ltofogis.apps.googleusercontent.com',
    iosBundleId: 'com.example.mskuChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOGlkEz6BqnfhMEWqw_pdgvDS0Bne6MLU',
    appId: '1:82682106403:ios:bd67c8c09f3af1a5b65796',
    messagingSenderId: '82682106403',
    projectId: 'dbchatapp-aa944',
    storageBucket: 'dbchatapp-aa944.appspot.com',
    iosClientId: '82682106403-o6ngb0rjdvvb90mnur5urcf9ltofogis.apps.googleusercontent.com',
    iosBundleId: 'com.example.mskuChatApp',
  );
}
