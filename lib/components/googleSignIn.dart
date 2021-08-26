import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final GoogleSignIn signIn = GoogleSignIn();

Future<UserCredential> SingInWithGoogle() async {
  try {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
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
    print(currentUser);
    return currentUser;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User> SignUpWithEmail(String email, String pass) async {
  try {
    final UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: pass);
    assert(userCredential != null);
    final User currentUser = _auth.currentUser;
    assert(currentUser.getIdToken() != null);
    print(currentUser);
    print(userCredential);
    return currentUser;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<UserCredential> SignInWithEmail(String email, String pass) async {
  try {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);

    assert(userCredential != null);
    return userCredential;
  } catch (e) {
    print(e);
  }
}
// sign in with google

Future signInWithGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

//Register with email
//Sign in with email
//Sing out

void SignOut() {
  signIn.signOut();
  _auth.signOut();
}
