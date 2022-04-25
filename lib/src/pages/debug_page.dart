import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({Key? key}) : super(key: key);

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
            NavigationButton(route: "/login", replace: false),
            NavigationButton(route: "/register", replace: false),
            NavigationButton(route: "/homepage", replace: false),
            NavigationButton(route: "/recappi", replace: false),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({Key? key, required this.route, required this.replace})
      : super(key: key);
  final String route;
  final bool replace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          if (!replace) {
            Navigator.pushNamed(context, route);
          } else {
            Navigator.pushReplacementNamed(context, route);
          }
        },
        child: Text(route),
      ),
    );
  }
}
