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
    apiKey: 'AIzaSyDIeNPf15ESbDQBjALITJ5M2y-Ch5CPQRk',
    appId: '1:193753542082:web:27210d3177716a23f47a5b',
    messagingSenderId: '193753542082',
    projectId: 'sophiee-messaging-app',
    authDomain: 'sophiee-messaging-app.firebaseapp.com',
    storageBucket: 'sophiee-messaging-app.appspot.com',
    measurementId: 'G-TNGC52QVX7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOkL1OmXZz82Iy4RPkqEAYdhtkgWLBI0o',
    appId: '1:193753542082:android:d262daf326032d20f47a5b',
    messagingSenderId: '193753542082',
    projectId: 'sophiee-messaging-app',
    storageBucket: 'sophiee-messaging-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7i-EoBQvlmZTI3w-1ZS2tX58pq80H7PE',
    appId: '1:193753542082:ios:aa8f895d417b65ccf47a5b',
    messagingSenderId: '193753542082',
    projectId: 'sophiee-messaging-app',
    storageBucket: 'sophiee-messaging-app.appspot.com',
    androidClientId: '193753542082-ce2iqt0n535ubrf5tfo66fhssg0jdd15.apps.googleusercontent.com',
    iosClientId: '193753542082-7ebnpoeubintmsc8tbpml1od56aoil8b.apps.googleusercontent.com',
    iosBundleId: 'com.android.sophiee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7i-EoBQvlmZTI3w-1ZS2tX58pq80H7PE',
    appId: '1:193753542082:ios:aa8f895d417b65ccf47a5b',
    messagingSenderId: '193753542082',
    projectId: 'sophiee-messaging-app',
    storageBucket: 'sophiee-messaging-app.appspot.com',
    androidClientId: '193753542082-ce2iqt0n535ubrf5tfo66fhssg0jdd15.apps.googleusercontent.com',
    iosClientId: '193753542082-7ebnpoeubintmsc8tbpml1od56aoil8b.apps.googleusercontent.com',
    iosBundleId: 'com.android.sophiee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIeNPf15ESbDQBjALITJ5M2y-Ch5CPQRk',
    appId: '1:193753542082:web:08b8c010ea06f010f47a5b',
    messagingSenderId: '193753542082',
    projectId: 'sophiee-messaging-app',
    authDomain: 'sophiee-messaging-app.firebaseapp.com',
    storageBucket: 'sophiee-messaging-app.appspot.com',
    measurementId: 'G-GD5DH7G1YJ',
  );
}
