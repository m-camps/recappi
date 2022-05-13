import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

dynamic getDocument() async {
  CollectionReference doc = FirebaseFirestore.instance.collection('recipes');
  final d = await doc.doc('uZw5QU8Wi4575hrEXOj0').get();
  final data = d.data();
  debugPrint(data.toString());
  return (data);
}
