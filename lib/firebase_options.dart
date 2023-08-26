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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkphNuiFhDNROaOHjDQ713EcrtYCfjPRE',
    appId: '1:112115462529:android:044e0b4df5f1dd090db880',
    messagingSenderId: '112115462529',
    projectId: 'chatapp-e1eea',
    storageBucket: 'chatapp-e1eea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1SlLsk7vwRA3yXivdfHT0Fj9krruTZV0',
    appId: '1:112115462529:ios:3853a69d6021b0060db880',
    messagingSenderId: '112115462529',
    projectId: 'chatapp-e1eea',
    storageBucket: 'chatapp-e1eea.appspot.com',
    iosClientId: '112115462529-6u586jl266p2r3f6ue8qs00ev6gdhp0v.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1SlLsk7vwRA3yXivdfHT0Fj9krruTZV0',
    appId: '1:112115462529:ios:b9556d6f153f10c60db880',
    messagingSenderId: '112115462529',
    projectId: 'chatapp-e1eea',
    storageBucket: 'chatapp-e1eea.appspot.com',
    iosClientId: '112115462529-40blg5cu4bem5p8esae9jojtuh9m5kpf.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
