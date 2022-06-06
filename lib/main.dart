import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/routes.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("SignedIn: " + auth.isSignedIn().toString(), name: "OnStartup");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Recappi",
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFD5320B, primaryRedSwatch),
        fontFamily: 'Raleway',
      ),
      routes: mainroute,
      initialRoute: (auth.isSignedIn()) ? "/homepage" : "/login",
    );
  }
}
