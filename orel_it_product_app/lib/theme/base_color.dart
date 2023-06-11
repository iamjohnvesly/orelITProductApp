import 'package:flutter/material.dart';

const Color colorPrimary = Color(0xff0E163D);
const Color appBlack = Color(0xff000000);
const Color appWhite = Color(0xffFFFFFF);
const Color textFieldBorder = Color.fromRGBO(0, 0, 0, 0.5);
const Color appRed = Color(0xffF05244);
const Color appGrey = Color(0xffE9E9E9);

class BaseColorTheme {
  BaseColorTheme._(); // this basically makes it so you can instantiate this class

  static const MaterialColor primary = MaterialColor(
    0xFF1B75BB,
    <int, Color>{
      500: Color(0xFF1B517B),
      400: Color(0xFF1C649C),
      300: Color(0xFF1B75BB),
      200: Color(0xFF458ED7),
      100: Color(0xFF65A9F4),
    },
  );
  static const MaterialColor defaultColor = MaterialColor(
    0xFF111C5F,
    <int, Color>{
      500: Color(0xFF111C5F),
      400: Color(0xFF172A80),
      300: Color(0xFF1D37A0),
      200: Color(0xFF2A4BC2),
      100: Color(0xFF4172E5),
    },
  );
}
