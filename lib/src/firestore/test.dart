import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recappi/src/utils.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String quote;
  final String photo;

  const AddUser(this.fullName, this.quote, this.photo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('profiles');
    final user = FirebaseAuth.instance.currentUser;

    Future<void> addUser() {
      return users
          .doc(user?.uid)
          .set({'name': fullName, 'photo': photo, 'quote': quote})
          .then((value) =>
              showSnackBar("Added user" + user!.uid.toString(), context))
          .catchError((error) => showSnackBar(error.toString(), context));
    }

    return TextButton(
        onPressed: addUser,
        child: const Text(
          "Add user",
        ));
  }
}
