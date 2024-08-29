import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjJRJ44F5VVQPdWPHwQ8AhxCLM8WS0pZA",
            authDomain: "droot-theroute.firebaseapp.com",
            projectId: "droot-theroute",
            storageBucket: "droot-theroute.appspot.com",
            messagingSenderId: "837805958901",
            appId: "1:837805958901:web:57b531ff222015374407bc",
            measurementId: "G-H1JEWDTMZT"));
  } else {
    await Firebase.initializeApp();
  }
}
