import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class EmailPasswordForm extends StatelessWidget {
  EmailPasswordForm({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EmailLoginFormField(
              emailController: _emailController,
            ),
            PasswordLoginFormField(passwordController: _passwordController),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (auth.currentUser == null) {
                      _login(context);
                    } else {
                      showSnackBar("Someone already is signed in", context);
                    }
                  }
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
                child: const Text('Dont have a account yet?',
                    style: TextStyle(
                      color: Colors.red,
                    )),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        String? _userEmail = userCredential.user?.email;
        showSnackBar("Succesfully logged in " + _userEmail.toString(), context);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/homepage', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar("Login failed error: " + e.code, context);
    }
  }
}

class EmailLoginFormField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailLoginFormField({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

class PasswordLoginFormField extends StatelessWidget {
  const PasswordLoginFormField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 8) {
          return 'Pleas enter more than 8 characters';
        }
        return null;
      },
    );
  }
}
