import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor mainOrange = MaterialColor(
    0xffff5a00, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffff5a00), //10%
      100: Color(0xffff6100), //20%
      200: Color(0xffff6100), //30%
      300: Color(0xffff6100), //40%
      400: Color(0xffff6100), //50%
      500: Color(0xffff6100), //60%
      600: Color(0xffff6100), //70%
      700: Color(0xffff6100), //80%
      800: Color(0xffff6100), //90%
      900: Color(0xffff6100), //100%
    },
  );
}
