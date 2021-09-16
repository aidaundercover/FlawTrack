import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/home_widget_volunteer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flawtrack/models/FlawtrackUser.dart';
import 'package:flawtrack/views/auth/sign_in.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flawtrack/views/first_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AuthService {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();

  Stream<String> get onAuthStateChanged => _firebaseAuth.userChanges().map(
        (user) {
          return user!.uid;
        },
      );

  // GET UID
  String getCurrentUID() {
    return _firebaseAuth.currentUser!.uid;
  }

  // GET CURRENT USER
  Future<FlawtrackUser> getCurrentUser() async {
    var firebaseUser = _firebaseAuth.currentUser;
    return FlawtrackUser(
        firebaseUser!.uid, firebaseUser.email, firebaseUser.displayName);
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/file-to-upload.png')
          .putFile(file);
    } on firebase_core.FirebaseException {}
  }

  getProfileImage() {
    if (_firebaseAuth.currentUser!.photoURL != null) {
      return Image.network('${_firebaseAuth.currentUser!.photoURL}',
          height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

//Sign Up with Email
  static signupWithEmail(
      {required String email,
      required String password,
      String? name,
      bool isVolunteer = false}) async {
    try {
      UserCredential res = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = res.user;

      Map<String, dynamic> userData = {
        "username": "$name",
        "email": "$email",
        "volunteer": isVolunteer
      };

      CollectionReference collectionReference = _db.collection('users');
      collectionReference.add(userData);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Аккаунт с такой почтой уже существует';
      }
    } catch (e) {
      return e;
    }
  }

  // Sign In with Email
  Future<FlawtrackUser> signInWithEmail(
      {required String email, required String password}) async {
    UserCredential res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return FlawtrackUser(res.user!.uid, res.user!.email, res.user!.displayName);
  }

  //Sign In with third party

  Future signInWithGoogle() async {
    final acc = await googleSignIn.signIn();
    final auth = await acc!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);
    final res = await _firebaseAuth.signInWithCredential(credential);
    return res.user;
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // Log out
  static logOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Delete acc

  static deleteAccount() async {
    try {
      return await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  Future updateUserName(name, currentUser) async {
    await currentUser.updateDisplayName(name);
    await currentUser.reload();
  }

// Reset Password
  passwordReset(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  
  Widget handleAuth() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (BuildContext context, snapshot) {
    
            if (snapshot.hasData && snapshot.data != null) {
              return StreamBuilder<DocumentSnapshot>(
                  stream: _db
                      .collection("users")
                      .doc(snapshot.data!.uid)
                      .snapshots(includeMetadataChanges: true),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    final bool signedIn = snapshot.hasData &&
                        FirebaseAuth.instance.currentUser!.emailVerified;
                    if (signedIn) {
                      if (snapshot.data!['volunteer']) {
                        return HomeVolunteer();
                      } else {
                        return HomeCitizen();
                      }
                    } else
                      return FirstView();
                  });
            }
            return FirstView();
          
        });
  }
  

// Update the usern
}

mixin NameValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return "Поле Имя не может быть пустым";
    }
    if (value.length < 2) {
      return "Имя должно содержать минимум 2 символа";
    }
    if (value.length > 50) {
      return "Имя не может быть длинее 50-ти символов";
    }
    return null;
  }
}

mixin EmailValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return "Поле Email не может быть пустым";
    }
    return null;
  }
}

mixin PasswordValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return "Пожалуйста введите пароль";
    }
    return null;
  }
}
