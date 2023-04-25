import 'package:flutter/material.dart';

Color backgroundColor = const Color(0xff1b1b1b);
Color primaryColor = const Color(0x80ffffff);
Color secondaryColor = const Color(0x1affffff);

Color fakePrimaryColor =
    const Color(0xff343434); // Isn't actually quite the right color.

class Palette {
  static const MaterialColor backgroundColor = MaterialColor(
    0xff1b1b1b, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff1b1b1b), //10%
      100: Color(0xff1b1b1b), //20%
      200: Color(0xff1b1b1b), //30%
      300: Color(0xff1b1b1b), //40%
      400: Color(0xff1b1b1b), //50%
      500: Color(0xff1b1b1b), //60%
      600: Color(0xff1b1b1b), //70%
      700: Color(0xff1b1b1b), //80%
      800: Color(0xff1b1b1b), //90%
      900: Color(0xff1b1b1b), //100%
    },
  );

  static const MaterialColor primaryColor = MaterialColor(
    0x80ffffff, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0x80ffffff), //10%
      100: Color(0x80ffffff), //20%
      200: Color(0x80ffffff), //30%
      300: Color(0x80ffffff), //40%
      400: Color(0x80ffffff), //50%
      500: Color(0x80ffffff), //60%
      600: Color(0x80ffffff), //70%
      700: Color(0x80ffffff), //80%
      800: Color(0x80ffffff), //90%
      900: Color(0x80ffffff), //100%
    },
  );
}
