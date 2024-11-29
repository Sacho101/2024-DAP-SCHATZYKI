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
    apiKey: 'AIzaSyBxLkjop73mE2z-jGfzDtqbAUdabZyHqkc',
    appId: '1:855786577868:web:751434c2d000d241870769',
    messagingSenderId: '855786577868',
    projectId: 'dapppp-23696',
    authDomain: 'dapppp-23696.firebaseapp.com',
    storageBucket: 'dapppp-23696.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApCVKZv7qh3GryHRkzar8zmFbHaCClrFw',
    appId: '1:855786577868:android:751434c2d000d241870769',
    messagingSenderId: '855786577868',
    projectId: 'dapppp-23696',
    storageBucket: 'dapppp-23696.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbGmvkeZKLJNo0L6Qat4oAr6tV2nvRGhs',
    appId: '1:855786577868:ios:751434c2d000d241870769',
    messagingSenderId: '855786577868',
    projectId: 'dapppp-23696',
    storageBucket: 'dapppp-23696.appspot.com',
    iosBundleId: 'com.example.listas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbGmvkeZKLJNo0L6Qat4oAr6tV2nvRGhs',
    appId: '1:855786577868:macos:751434c2d000d241870769',
    messagingSenderId: '855786577868',
    projectId: 'dapppp-23696',
    storageBucket: 'dapppp-23696.appspot.com',
    iosBundleId: 'com.example.listas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBxLkjop73mE2z-jGfzDtqbAUdabZyHqkc',
    appId: '1:855786577868:windows:751434c2d000d241870769',
    messagingSenderId: '855786577868',
    projectId: 'dapppp-23696',
    authDomain: 'dapppp-23696.firebaseapp.com',
    storageBucket: 'dapppp-23696.appspot.com',
  );
}