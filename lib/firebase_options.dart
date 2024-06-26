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
    apiKey: 'AIzaSyAdrSQ6_f-lxBpZUuxRjDViMpjSFUgzUt4',
    appId: '1:547625483270:web:1f0585ed30f23e900e1787',
    messagingSenderId: '547625483270',
    projectId: 'jobmingle-91729',
    authDomain: 'jobmingle-91729.firebaseapp.com',
    storageBucket: 'jobmingle-91729.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAv-M0XQW07eQRNLHBn5y7u0u1DRWKYig',
    appId: '1:547625483270:android:8942ee98c046ba2d0e1787',
    messagingSenderId: '547625483270',
    projectId: 'jobmingle-91729',
    storageBucket: 'jobmingle-91729.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsL-rkJ4nwfLbNUfMA_IaOsKzzlBcZ1uU',
    appId: '1:547625483270:ios:ed734287c9da9f4c0e1787',
    messagingSenderId: '547625483270',
    projectId: 'jobmingle-91729',
    storageBucket: 'jobmingle-91729.appspot.com',
    androidClientId: '547625483270-m7mu49mo0kl3n9u6ib0esvfmt966mk28.apps.googleusercontent.com',
    iosClientId: '547625483270-r6m5nj16bpjr8ql99vohbj86sdp6tdau.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobMingleWeb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsL-rkJ4nwfLbNUfMA_IaOsKzzlBcZ1uU',
    appId: '1:547625483270:ios:ed734287c9da9f4c0e1787',
    messagingSenderId: '547625483270',
    projectId: 'jobmingle-91729',
    storageBucket: 'jobmingle-91729.appspot.com',
    androidClientId: '547625483270-m7mu49mo0kl3n9u6ib0esvfmt966mk28.apps.googleusercontent.com',
    iosClientId: '547625483270-r6m5nj16bpjr8ql99vohbj86sdp6tdau.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobMingleWeb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAdrSQ6_f-lxBpZUuxRjDViMpjSFUgzUt4',
    appId: '1:547625483270:web:785f8b1dc21ff2620e1787',
    messagingSenderId: '547625483270',
    projectId: 'jobmingle-91729',
    authDomain: 'jobmingle-91729.firebaseapp.com',
    storageBucket: 'jobmingle-91729.appspot.com',
  );

}