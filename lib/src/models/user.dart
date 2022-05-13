import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recappi/src/utils.dart';

class AddUserToFirestore extends StatelessWidget {
  final String fullName;
  final String quote;
  final String photo;

  const AddUserToFirestore(this.fullName, this.quote, this.photo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('profiles');

    Future<void> addUserToFirestore() {
      final user = FirebaseAuth.instance.currentUser;
      return users
          .doc(user!.uid)
          .set({'name': fullName, 'photo': photo, 'quote': quote})
          .then((value) =>
              showSnackBar("Added user" + user.uid.toString(), context))
          .catchError((error) => showSnackBar(error.toString(), context));
    }

    return ElevatedButton(
      onPressed: addUserToFirestore,
      child: const Text(
        "Add user",
      ),
    );
  }
}

class GetUserName extends StatelessWidget {
  const GetUserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('profiles');
    final user = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user?.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return (Text("Data:" + data['quote']));
        }
        return const Text("loading");
      },
    );
  }
}
