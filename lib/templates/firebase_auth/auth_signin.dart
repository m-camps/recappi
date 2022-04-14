import 'package:firebase_auth/firebase_auth.dart';

void signin() async {
  try {
    // ignore: unused_local_variable
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "maxi.camps@gmail.com",
      password: "Test1234",
    );
  } on FirebaseAuthException catch (e) {
    // ignore: avoid_print
    print(e);
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
