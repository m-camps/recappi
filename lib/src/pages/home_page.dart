import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text("Login"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: const Text("Register"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/recappi');
                },
                child: const Text("Recappi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
