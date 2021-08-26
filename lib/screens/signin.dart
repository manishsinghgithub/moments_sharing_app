import 'package:flutter/material.dart';
import 'package:moments/Services/authServices.dart';
import 'package:moments/components/roundbutton.dart';
import 'package:moments/constants/constants.dart';
import 'package:moments/screens/home.dart';
import 'package:moments/screens/signup.dart';

class SignIn extends StatelessWidget {
  static String id = 'signIn';
  String email, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: kDecorationAniamtion,
      padding: EdgeInsets.only(left: 30, right: 20),
      child: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('images/1pic.png')),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Share your best MOMENTS',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Regular',
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: kTextForInput.copyWith(labelText: 'Email'),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: kTextForInput.copyWith(labelText: 'Password'),
              onChanged: (value) {
                pass = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
              title: 'LOG IN',
              onPressed: () async {
                final uid = await AuthServices().signInWithEmail(email, pass);
                if (uid != null) {
                  Navigator.pushNamed(context, HomePage.id);
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text('or')),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
              title: 'SIGN UP',
              onPressed: () {
                Navigator.pushNamed(context, SignUp.id);
              },
            ),
            SizedBox(
              height: 10,
            ),
            GoogleButton(
              title: 'GOOGLE',
              onPressed: () async {
                final uid = await AuthServices().googleSingIn();
                if (uid != null) {
                  Navigator.pushNamed(context, HomePage.id);
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
