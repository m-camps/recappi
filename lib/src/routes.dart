import 'package:flutter/material.dart';
import 'package:recappi/old_files/profile.dart';
import 'package:recappi/old_files/recappi.dart';
import 'package:recappi/old_files/single_recipe.dart';
import 'package:recappi/src/auth.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';

Map<String, WidgetBuilder> mainroute = <String, WidgetBuilder>{
  '/home': (BuildContext context) => const HomePage(),
  '/auth': (BuildContext context) => const AuthPage(),
  '/login': (BuildContext context) => const LoginPage(),
  '/register': (BuildContext context) => const RegisterPage(),
  '/recappi': (BuildContext context) => const Recappi2021(),
  '/singlerecipe': (context) => const SingleRecipe(),
  '/profile': (context) => const Profile(),
};
