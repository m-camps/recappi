import 'package:firebase_auth/firebase_auth.dart';

void registerEmailPassword() async {
  await FirebaseAuth.instance.signOut();
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "maxi.camps@gmail.com",
      password: "Test1234",
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // ignore: avoid_print
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      // ignore: avoid_print
      print('The account already exists for that email.');
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
