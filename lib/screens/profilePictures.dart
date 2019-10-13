import 'dart:io';

import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictures extends StatefulWidget {
  @override
  _ProfilePicturesState createState() => _ProfilePicturesState();
}

class _ProfilePicturesState extends State<ProfilePictures> {
  File _image;
  BuildContext context2;
  //TextEditingController shortMeText = TextEditingController();
  bool verifyEnabled = false;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    context2 = context;
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text('Add Email'),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: FancyFab(
          context: context,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pictures',
                  style: TextStyle(
                      fontSize: 35, color: Theme.of(context).primaryColor),
                ),
                Text(
                  'Viewed by #1 matches',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: getImage,
                      ),
                      Center(
                        child: _image == null
                            ? Text('No image selected.')
                            : Image.file(_image),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[],
                  ),
                )
              ],
            ),
            GradientButton.getGradiantButton(context, addUserEmail, 'CONTINUE',
                Colors.black, 20, verifyEnabled),
          ],
        ),
      ),
    );
  }

  void addUserEmail() {
    // Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new MoreMeLong()));
  }
}
