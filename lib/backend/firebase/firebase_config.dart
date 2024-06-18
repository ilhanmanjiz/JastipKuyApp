import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIfJDEdHjdwm1lqSqAyVfQAWVVfrGV85U",
            authDomain: "jastip-kuy-7f46nz.firebaseapp.com",
            projectId: "jastip-kuy-7f46nz",
            storageBucket: "jastip-kuy-7f46nz.appspot.com",
            messagingSenderId: "328598911059",
            appId: "1:328598911059:web:d5e4d892d76d320f892ea6"));
  } else {
    await Firebase.initializeApp();
  }
}
