import 'package:flutter/material.dart';
import 'package:recappi/old_files/profile.dart';
import 'package:recappi/old_files/recappi.dart';
import 'package:recappi/old_files/single_recipe.dart';
import 'package:recappi/src/screens/main_nav_page.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_page.dart';
import '../legacy/debug_page.dart';

Map<String, WidgetBuilder> mainroute = <String, WidgetBuilder>{
  '/debugpage': (BuildContext context) => const DebugPage(),
  '/login': (BuildContext context) => const LoginPage(),
  '/register': (BuildContext context) => const RegisterPage(),
  '/homepage': (BuildContext context) => const HomePage(),
  '/recappi': (context) => const Recappi2021(),
  '/singlerecipe': (context) => const SingleRecipe(),
  '/profile': (context) => const Profile(),
};
