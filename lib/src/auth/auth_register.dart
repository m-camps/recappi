import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({Key? key}) : super(key: key);
  final String title = 'Registration';
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (value.length < 8) {
                  return 'Please use more than 8 characters';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _register();
                  }
                  // ignore:, avoid_print
                  print(FirebaseAuth.instance.currentUser);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text('Already have a account?',
                    style: TextStyle(
                      color: Colors.red,
                    )),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        String? _userEmail = userCredential.user?.email;
        showSnackBar(
            "Succesfully registered " + _userEmail.toString(), context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar("Registering failed error: " + e.code, context);
    }
  }
}
