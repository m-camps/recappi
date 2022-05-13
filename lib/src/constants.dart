import 'package:flutter/material.dart';
import 'package:recappi/src/manager/auth_manager.dart';

const primaryRed = Color(0xFFD5320B);
const extraGreen = Color(0xFF009070);
const secondaryRed = Color(0xFFFF7042);
const white = Color(0xFFFFFFFF);
const whiteBG = Color(0xFFFAEFEC);
const unselected = Color(0xFFBBBBBB);
const text = Color(0xFF383838);

const Map<int, Color> primaryRedSwatch = {
  50: Color.fromRGBO(213, 50, 11, .1),
  100: Color.fromRGBO(213, 50, 11, .2),
  200: Color.fromRGBO(213, 50, 11, .3),
  300: Color.fromRGBO(213, 50, 11, .4),
  400: Color.fromRGBO(213, 50, 11, .5),
  500: Color.fromRGBO(213, 50, 11, .6),
  600: Color.fromRGBO(213, 50, 11, .7),
  700: Color.fromRGBO(213, 50, 11, .8),
  800: Color.fromRGBO(213, 50, 11, .9),
  900: Color.fromRGBO(213, 50, 11, 1),
};

AuthManager auth = AuthManager();
// StorageManager storage = StorageManager();
