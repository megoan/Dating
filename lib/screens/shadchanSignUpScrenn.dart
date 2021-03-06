import 'dart:io';

import 'package:dating/clippers/clipper1.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/widgets/OutLineButtonMy.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../main.dart';
import 'homePage.dart';

Locale locale;

class ShadchanSignUpScreen extends StatefulWidget {
  @override
  _ShadchanSignUpScreenState createState() => _ShadchanSignUpScreenState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _ShadchanSignUpScreenState state = context.findAncestorRenderObjectOfType();
    locale = newLocale;
    state.setState(() {});
  }

  static String getLocale() {
    try {
      if (locale != null) {
        return locale.languageCode;
      } else
        return ui.window.locale.languageCode;
    } catch (error) {
      print("error in get locale $error");
      return "en";
    }
  }
}

class _ShadchanSignUpScreenState extends State<ShadchanSignUpScreen> {
  //File _image1;

  File _image1;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  bool verifyEnabled = false;
  bool emailCeked = false;
  bool nameChecked = false;
  bool imageChecked = false;
  void checkValid() {
    setState(() {
      verifyEnabled = emailCeked && nameChecked && imageChecked;
    });
  }

  void imageCallBack1(var image) {
    if (image == null) {
      imageChecked = false;
    } else {
      imageChecked = true;
    }
    setState(() {
      _image1 = image;
    });
    checkValid();
  }

  void addUserEmail() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new HomePage()));
  }

  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      locale = Locale("he");
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(top:150),
      //   child: FancyFab(
      //     context: context,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              // Box decoration takes a gradient
              // gradient: LinearGradient(
              //   // Where the linear gradient begins and ends
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   // Add one stop for each color. Stops should increase from 0 to 1
              //   stops: [0.1, 0.4, 0.7, 0.9],
              //   colors: [
              //     // Colors are easy thanks to Flutter's Colors class.
              //     Colors.blue[500].withOpacity(0.7),
              //     Colors.purple[500].withOpacity(0.7),
              //      Colors.purple[500].withOpacity(0.7),
              //     Colors.pink[500].withOpacity(0.7),
              //   ],
              // ),
              ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ClipPath(
                            clipper: MyClipper3(),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                // Where the linear gradient begins and ends
                                focal: Alignment.topRight,
                                radius: 10,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                //stops: [0.1, 0.4,],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Colors.blue[300],
                                  Colors.blue[600],
                                ],
                              )),
                              width: double.infinity,
                              height: 300,
                              // color:Theme.of(context).primaryColor
                            ),
                          ),
                          ClipPath(
                            clipper: MyClipper2(),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                // Where the linear gradient begins and ends
                                focal: Alignment.topRight,
                                radius: 10,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                //stops: [0.1, 0.4,],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Colors.blue[500],
                                  Colors.blue[800],
                                ],
                              )),
                              width: double.infinity,
                              height: 300,
                              // color:Theme.of(context).primaryColor
                            ),
                          ),
                          ClipPath(
                            clipper: MyClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                // Where the linear gradient begins and ends
                                focal: Alignment.topRight,
                                radius: 1,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                //stops: [0.1, 0.4,],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Colors.blue[500],
                                  Colors.blue[800],
                                ],
                              )),
                              width: double.infinity,
                              height: 300,
                              // color:Theme.of(context).primaryColor
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              PhotoPicker(
                                image: _image1,
                                imageCallBack: imageCallBack1,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                LocaleText.getLocaleText(MyApp.getLocale(), 'Your picture'),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(
                        //   height: 50,
                        // ),
                        Padding(
                          //Add padding around textfield
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: _usernameController,
                            onChanged: (value) {
                              if (value.length > 3) {
                                nameChecked = true;
                              } else {
                                nameChecked = false;
                              }
                              checkValid();
                            },
                            decoration: InputDecoration(
                              // focusColor: Colors.white,
                              // fillColor: Colors.white,
                              // hoverColor: Colors.white,
                              hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'name'),

                              //add icon outside input field
                              icon: Icon(Icons.person),

                              //add icon to the beginning of text field
                              //prefixIcon: Icon(Icons.person),
                              //can also add icon to the end of the textfiled
                              //suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          //Add padding around textfield
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: _emailController,
                            onChanged: (value) {
                              String patttern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                              RegExp regExp = new RegExp(patttern);
                              if (regExp.hasMatch(value)) {
                                emailCeked = true;
                              } else {
                                emailCeked = false;
                              }
                              checkValid();
                            },
                            decoration: InputDecoration(
                              hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'email'),
                              //add icon outside input field
                              icon: Icon(Icons.mail),

                              //add icon to the beginning of text field
                              //prefixIcon: Icon(Icons.person),
                              //can also add icon to the end of the textfiled
                              //suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: verifyEnabled?addUserEmail:null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors:verifyEnabled? [Colors.blue[800], Colors.blue[300]]:[Colors.grey[400],Colors.grey[300]],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          LocaleText.getLocaleText(MyApp.getLocale(), 'Get Started'),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                // RaisedButton(
                //   onPressed: addUserEmail,
                //   child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Get Started')),
                // ),
                //OutLineButtonMy(verifyEnabled: verifyEnabled,callBackFunction: addUserEmail,text:  LocaleText.getLocaleText(MyApp.getLocale(), 'Get Started'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
