import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/utils.dart';

class SignOutUser extends StatelessWidget {
  const SignOutUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FirebaseAuth user = FirebaseAuth.instance;
        if (user.currentUser != null) {
          FirebaseAuth.instance.signOut();
          showSnackBar(
              "Signed out " + user.currentUser!.uid.toString(), context);
        } else {
          showSnackBar("Nobody signed in!", context);
        }
      },
      child: const Text("Sign Out"),
    );
  }
}
