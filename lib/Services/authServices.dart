import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _signIn = GoogleSignIn();

  // google Sign in

  Future googleSingIn() async {
    try {
      final GoogleSignInAccount googleUser = await _signIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      assert(googleUser.email != null);
      assert(googleUser.displayName != null);
      assert(credential.idToken != null);
      assert(credential.accessToken != null);

      final UserCredential currentUser =
          await _auth.signInWithCredential(credential);
      final User user = currentUser.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email..
  Future registerWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User user = userCredential.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with eamil..
  Future signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User user = userCredential.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // Sign out..

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
