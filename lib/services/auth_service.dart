import 'dart:io';
import 'package:flawtrack/home_widget_citizen.dart';
import 'package:flawtrack/home_widget_volunteer.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flawtrack/models/FlawtrackUser.dart';
import 'package:flawtrack/views/first_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AuthService {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore _db = FirebaseFirestore.instance;

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
  //Future<FlawtrackUser> getCurrentUser() async {
  //var firebaseUser = _firebaseAuth.currentUser;
  //return FlawtrackUser(
  //firebaseUser!.uid, firebaseUser.email, firebaseUser.name,firebaseUser.volunteer);
  //}

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
  
  // Sign In with Email
  static Future<void> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    UserCredential res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeCitizen()));
  }

  //Sign In with third party

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
            'The user must reauthenticate before thisoperation can be executed.');
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
