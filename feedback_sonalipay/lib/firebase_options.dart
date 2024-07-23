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
    apiKey: 'AIzaSyALSxEwhqA04YtheqnW-ICuCWWlB9R4LEs',
    appId: '1:542553101161:web:0535f5d36b7d55e1c6a3f8',
    messagingSenderId: '542553101161',
    projectId: 'sonalipayfeedback',
    authDomain: 'sonalipayfeedback.firebaseapp.com',
    storageBucket: 'sonalipayfeedback.appspot.com',
    measurementId: 'G-7K00794Z2P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA149VyxscGbukpg5zDMKvnSTMC0943X78',
    appId: '1:542553101161:android:5b551cb7926527c1c6a3f8',
    messagingSenderId: '542553101161',
    projectId: 'sonalipayfeedback',
    storageBucket: 'sonalipayfeedback.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRmJsGiFd74aOxW41pMtEWEAU8DfqsQxY',
    appId: '1:542553101161:ios:dc0b8c3e7766fcf8c6a3f8',
    messagingSenderId: '542553101161',
    projectId: 'sonalipayfeedback',
    storageBucket: 'sonalipayfeedback.appspot.com',
    iosBundleId: 'com.sbuk.feedbackSonalipay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRmJsGiFd74aOxW41pMtEWEAU8DfqsQxY',
    appId: '1:542553101161:ios:d3559ff7bc6ab985c6a3f8',
    messagingSenderId: '542553101161',
    projectId: 'sonalipayfeedback',
    storageBucket: 'sonalipayfeedback.appspot.com',
    iosBundleId: 'com.example.feedbackSonalipay',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALSxEwhqA04YtheqnW-ICuCWWlB9R4LEs',
    appId: '1:542553101161:web:cabda84688cb7d45c6a3f8',
    messagingSenderId: '542553101161',
    projectId: 'sonalipayfeedback',
    authDomain: 'sonalipayfeedback.firebaseapp.com',
    storageBucket: 'sonalipayfeedback.appspot.com',
    measurementId: 'G-TXJ99NEPRV',
  );
}
