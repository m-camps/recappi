import 'package:flutter/material.dart';
import 'package:recappi/old_files/profile.dart';
import 'package:recappi/old_files/recappi.dart';
import 'package:recappi/old_files/single_recipe.dart';
import 'package:recappi/src/pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/debug_page.dart';

Map<String, WidgetBuilder> mainroute = <String, WidgetBuilder>{
  '/': (BuildContext context) => const DebugPage(),
  '/login': (context) => const LoginPage(),
  '/register': (BuildContext context) => const RegisterPage(),
  '/homepage': (BuildContext context) => const HomePage(),
  '/recappi': (context) => const Recappi2021(),
  '/singlerecipe': (context) => const SingleRecipe(),
  '/profile': (context) => const Profile(),
};
