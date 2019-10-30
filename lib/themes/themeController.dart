import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'darkTheme.dart';
import 'lightTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeController {
  static void switchTheme(BuildContext context)   {

    Future<bool> savedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var themeType = (prefs.getBool('theme'));
    if(themeType==null || themeType==true){
      prefs.setBool('theme',false);
    }
    else{
       prefs.setBool('theme',true);
    }
    return themeType;
  }
  savedTheme().then((value) {
     if(!value){
        DynamicTheme.of(context).setThemeData(LightTheme.getTheme());     
      }
      else{
       DynamicTheme.of(context).setThemeData(DarkTheme.getTheme());  
      }
    });
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
