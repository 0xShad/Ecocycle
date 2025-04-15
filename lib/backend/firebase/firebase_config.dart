import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDNAocBj8WqpTZjrAsPcJhYxx231uM9bo0",
            authDomain: "ecocycle-a68bc.firebaseapp.com",
            projectId: "ecocycle-a68bc",
            storageBucket: "ecocycle-a68bc.firebasestorage.app",
            messagingSenderId: "411031323289",
            appId: "1:411031323289:web:7e13c8f8261460f2382e08"));
  } else {
    await Firebase.initializeApp();
  }
}
