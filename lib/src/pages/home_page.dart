import 'package:flutter/material.dart';
import 'package:recappi/src/firebase_auth/auth_signout.dart';
import 'package:recappi/src/firestore/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [SignOutUser()],
        title: const Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavigationButton(route: "/login"),
            NavigationButton(route: "/register"),
            AddUserToFirestore("Max", "Very nice", "someUrl"),
            GetUserName(),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({Key? key, required this.route}) : super(key: key);
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(route),
      ),
    );
  }
}
