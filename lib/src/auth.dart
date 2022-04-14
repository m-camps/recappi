import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth/auth_login.dart';
import 'auth/auth_register.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return TextButton(
              child: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final User? user = auth.currentUser;
                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No one signed in.'),
                  ));
                  return;
                }
                auth.signOut();
                final String uid = user.email.toString();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has succesfully signed out.'),
                ));
              },
            );
          })
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: const <Widget>[
            RegisterEmail(),
            EmailPasswordForm(),
          ],
        );
      }),
    );
  }
}
