import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/routes.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainFrame());
}

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Recappi",
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFD5320B, primaryRedSwatch),
      ),
      routes: mainroute,
      initialRoute: "/",
    );
  }
}
