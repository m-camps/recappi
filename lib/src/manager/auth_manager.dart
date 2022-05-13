import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager {
  FirebaseAuth auth = FirebaseAuth.instance;

  void login(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        debugPrint("Succesfully logged" + user.user!.email.toString());
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Login failed - error: " + e.code);
    }
  }

  void register(String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        debugPrint("Succesfully registered user");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Registering failed - error: " + e.code);
    }
  }

  void signOut() {
    if (auth.currentUser != null) {
      auth.signOut();
      debugPrint("Signed out");
    } else {
      debugPrint("Nobody signed in!");
    }
  }

  bool isSignedIn() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  String getUid() {
    return auth.currentUser!.uid;
  }
}
