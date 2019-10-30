import 'dart:io';

import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';

class ShadchanSignUpScreen extends StatefulWidget {
  @override
  _ShadchanSignUpScreenState createState() => _ShadchanSignUpScreenState();
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
    // Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new AddGender()));
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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.indigo[800],
                    Colors.purple[700],
                    Colors.pink[600],
                    Colors.pink[800],
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          PhotoPicker(
                            image: _image1,
                            imageCallBack: imageCallBack1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Your Picture",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
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
                                  hintText: "Your name",
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
                                  String patttern =
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                  RegExp regExp = new RegExp(patttern);
                                  if (regExp.hasMatch(value)) {
                                    emailCeked = true;
                                  } else {
                                    emailCeked = false;
                                  }
                                  checkValid();
                                },
                                decoration: InputDecoration(
                                  hintText: "Your email",
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
                    GradientButton.getGradiantButton(context, addUserEmail,
                        'GET STARTED', Colors.black, 20, verifyEnabled),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
