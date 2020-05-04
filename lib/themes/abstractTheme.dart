import 'package:flutter/material.dart';

class AbstractTheme {

  final MaterialColor primary =  MaterialColor(
     0xFF3C46A2,
    const <int, Color>{
      50: const Color(0xFFE7E8F3),
      100: const Color(0xFFC2C6E3),
      200: const Color(0xFF9DA1B0),
      300: const Color(0xFF747DBD),
      400: const Color(0xFF5861AF),
      500: const Color(0xFF3C46A2),
      600: const Color(0xFF363E98),
      700: const Color(0xFF2E358D),
      800: const Color(0xFF262B81),
      900: const Color(0xFF18196C),
    },
  );


   MaterialColor secondary = const MaterialColor(
    0xFF2636FB,
    const <int, Color>{
      50: const Color(0xFFE9E8FF),
      100: const Color(0xFFC8C6FF),
      200: const Color(0xFFA0A0FF),
      300: const Color(0xFF757AFF),
      400: const Color(0xFF515AFF),
      500: const Color(0xFF2636FB),
      600: const Color(0xFF222CEE),
      700: const Color(0xFF131CE2),
      800: const Color(0xFF0002D7),
      900: const Color(0xFF0000BD),
    },
  );

   Color filterBackgroundColor = Color(0xff262e4b);
   Color fillColor = Color(0xff212842);
   Color textColor = Colors.white;
}

class DarkTheme extends AbstractTheme{

  final MaterialColor primary = const MaterialColor(
    0xFF3C46A2,
    const <int, Color>{
      50: const Color(0xFFE7E8F3),
      100: const Color(0xFFC2C6E3),
      200: const Color(0xFF9DA1B0),
      300: const Color(0xFF747DBD),
      400: const Color(0xFF5861AF),
      500: const Color(0xFF3C46A2),
      600: const Color(0xFF363E98),
      700: const Color(0xFF2E358D),
      800: const Color(0xFF262B81),
      900: const Color(0xFF18196C),
    },
  );


   MaterialColor secondary = const MaterialColor(
    0xFF2636FB,
    const <int, Color>{
      50: const Color(0xFFE9E8FF),
      100: const Color(0xFFC8C6FF),
      200: const Color(0xFFA0A0FF),
      300: const Color(0xFF757AFF),
      400: const Color(0xFF515AFF),
      500: const Color(0xFF2636FB),
      600: const Color(0xFF222CEE),
      700: const Color(0xFF131CE2),
      800: const Color(0xFF0002D7),
      900: const Color(0xFF0000BD),
    },
  );

   Color filterBackgroundColor = Color(0xff262e4b);
   Color fillColor = Color(0xff212842);
   Color textColor = Colors.white;
}

class LightTheme extends AbstractTheme{
   final MaterialColor primary = const MaterialColor(
    0xFF3C46A2,
    const <int, Color>{
      50: const Color(0xFFE7E8F3),
      100: const Color(0xFFC2C6E3),
      200: const Color(0xFF9DA1B0),
      300: const Color(0xFF747DBD),
      400: const Color(0xFF5861AF),
      500: const Color(0xFF3C46A2),
      600: const Color(0xFF363E98),
      700: const Color(0xFF2E358D),
      800: const Color(0xFF262B81),
      900: const Color(0xFF18196C),
    },
  );


   MaterialColor secondary = const MaterialColor(
    0xFF2636FB,
    const <int, Color>{
      50: const Color(0xFFE9E8FF),
      100: const Color(0xFFC8C6FF),
      200: const Color(0xFFA0A0FF),
      300: const Color(0xFF757AFF),
      400: const Color(0xFF515AFF),
      500: const Color(0xFF2636FB),
      600: const Color(0xFF222CEE),
      700: const Color(0xFF131CE2),
      800: const Color(0xFF0002D7),
      900: const Color(0xFF0000BD),
    },
  );

   Color filterBackgroundColor = Color(0xff262e4b);
   Color fillColor = Color(0xff212842);
   Color textColor = Colors.white;
}





