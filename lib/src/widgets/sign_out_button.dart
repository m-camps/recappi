import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recappi/old_files/style.dart';
import 'package:recappi/src/utils.dart';

class SignOutUser extends StatelessWidget {
  const SignOutUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        FirebaseAuth user = FirebaseAuth.instance;
        if (user.currentUser != null) {
          user.signOut();
          showSnackBar(
              "Signed out " + user.currentUser!.uid.toString(), context);
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
        } else {
          showSnackBar("Nobody signed in!", context);
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
        }
      },
      child: const Icon(Icons.logout, color: white),
    );
  }
}
