import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawtrack/widgets/home_view/change_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  GoogleSignInAccount get user => googleSignInAccount!;

  login() async {
    this.googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) return;

    final googleAuth = await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  logout() async {
    this.googleSignInAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}
