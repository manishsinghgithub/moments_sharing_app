import 'package:flutter/material.dart';
import 'package:moments/screens/home.dart';
import 'package:moments/screens/signup.dart';
import 'screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  runApp(Moments());
}

class Moments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignIn.id,
      routes: {
        SignUp.id: (context) => SignUp(),
        SignIn.id: (context) => SignIn(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
