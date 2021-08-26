import 'package:flutter/material.dart';
import 'package:moments/Services/authServices.dart';
import 'package:moments/components/roundbutton.dart';
import 'package:moments/constants/constants.dart';
import 'package:moments/screens/home.dart';

class SignUp extends StatelessWidget {
  static String id = 'signUp';
  String name, email, pass;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: kDecorationAniamtion,
          padding: EdgeInsets.only(left: 30, right: 20),
          child: SafeArea(
            child: ListView(
              children: [
                Container(
                  child: Image(image: AssetImage('images/2pic.png')),
                ),
                Text(
                  'Sign up to share and see best Moments',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat-Regular',
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
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
                  title: 'SIGN UP',
                  onPressed: () async {
                    final uid =
                        await AuthServices().registerWithEmail(email, pass);
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
                GoogleButton(
                  title: 'GOOGLE',
                  onPressed: () async {
                    final uid = await AuthServices().googleSingIn();
                    if (uid != null) {
                      Navigator.pushNamed(context, HomePage.id);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('already have Moments account.'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
