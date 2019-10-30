import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData getTheme() {
    Map<int, Color> color =
{
50:Color.fromRGBO(16,0,38, .1),
100:Color.fromRGBO(16,0,38, .2),
200:Color.fromRGBO(16,0,38, .3),
300:Color.fromRGBO(16,0,38, .4),
400:Color.fromRGBO(16,0,38, .5),
500:Color.fromRGBO(16,0,38, .6),
600:Color.fromRGBO(16,0,38, .7),
700:Color.fromRGBO(16,0,38, .8),
800:Color.fromRGBO(16,0,38, .9),
900:Color.fromRGBO(16,0,38, 1),
};
MaterialColor colorCustom = MaterialColor(0xA00026, color);
    // DynamicTheme.of(context).setBrightness(Brightness.dark);
    return new ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colorCustom[900],
      backgroundColor:colorCustom[900] ,
      primaryColor: Colors.lightBlueAccent,
      accentColor: Colors.white,
    //   inputDecorationTheme: InputDecorationTheme(
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color:  Colors.lightBlueAccent)
    //   )
    // )
    );
  }
}
