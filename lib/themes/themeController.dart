
import 'package:flutter/material.dart';

import 'darkTheme.dart';
import 'lightTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeController {
  static void switchTheme(BuildContext context)   {

  

  }
  
 
 static Future<ThemeData> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var themeType = (prefs.getBool('theme'));
    if(themeType==null || themeType==true){
      
      if(themeType==null){
         prefs.setBool('theme',true);
      }
      return DarkTheme.getTheme();
    }
    else{
       return LightTheme.getTheme();
    }
  
  }

}
