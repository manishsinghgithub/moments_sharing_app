import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  RoundedButton({
    this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        color: Colors.white,
      ),
      child: FlatButton(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Montserrat, Montserrat-Regular',
              fontWeight: FontWeight.w500),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  GoogleButton({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        color: Colors.white,
      ),
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/google_logo.png'),
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Montserrat, Montserrat-Regular',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
