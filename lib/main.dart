import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mk/sing_in.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBxlxB-nnjgEN542jqPvQrQo9O9KhgO9D8",
    authDomain: "milotech-33497.firebaseapp.com",
    projectId: "milotech-33497",
    storageBucket: "milotech-33497.appspot.com",
    messagingSenderId: "1090838931629",
    appId: "1:1090838931629:web:64efe23033a1a187277e24",
  ));

  runApp(const Maktabati());
}

class Maktabati extends StatelessWidget {
  const Maktabati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(focusColor: Colors.blue),
        initialRoute: SingIn.screenRout,
        routes: {
          // GoogleAuth.screenRout: (context) => const GoogleAuth(),
          // Auth.screenRout: (context) => const Auth(),
          SingIn.screenRout: (context) => const SingIn(),
          // SingUp.screenRout: (context) => const SingUp(),
          Home.screenRout: (context) => const Home(),
          // WelcomScreen.screenRout: (context) => const WelcomScreen(),
        });
  }
}
