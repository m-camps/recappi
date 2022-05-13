import 'package:flutter/material.dart';
import '../firebase_auth/auth_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: EmailPasswordForm(),
    );
  }
}
