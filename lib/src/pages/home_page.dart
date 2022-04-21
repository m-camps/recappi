import 'package:flutter/material.dart';
import 'package:recappi/src/firestore/test.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavigationButton(route: "/login"),
            NavigationButton(route: "/register"),
            NavigationButton(route: "/recappi"),
            AddUser("Max", "Very nice", "someUrl"),
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
