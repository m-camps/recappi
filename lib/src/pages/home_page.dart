import 'package:flutter/material.dart';
import 'package:recappi/src/storage_util.dart';

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
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text("Login"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text("Register"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recappi');
                },
                child: const Text("Recappi"),
              ),
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return Image.network(
                  snapshot.data.toString(),
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                );
              },
              future: getImageUrl("recipe_1.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
