import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup {
  static final _authUser = FirebaseAuth.instance;
  static Future signUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      UserCredential _userCredinteal =
          await _authUser.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? _user = _userCredinteal.user;
      return _user;
    } catch (e) {
      print("$e");
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future signInAccount(String email, String password) async {
    if (_authUser.currentUser == null) {
      try {
        UserCredential? signedUser = await _authUser.signInWithEmailAndPassword(
            email: email, password: password);
        return true;
      } catch (e) {}
    }
  }

  static Future logOut(BuildContext context) async {
   await _authUser.signOut().then((value) {
      Navigator.pushNamed(context, "/first");
    });
  }
}
