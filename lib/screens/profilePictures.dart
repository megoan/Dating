import 'dart:io';

import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictures extends StatefulWidget {
  @override
  _ProfilePicturesState createState() => _ProfilePicturesState();
}

class _ProfilePicturesState extends State<ProfilePictures> {
  File _image1;
  File _image2;
  File _image3;
  File _image4;

  BuildContext context2;
  //TextEditingController shortMeText = TextEditingController();
  bool verifyEnabled = false;
  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = image;
  //   });
  // }
  void imageCallBack1(var image) {
    if (image == null) {
      setState(() {
        _image1 = _image2;
        _image2 = _image3;
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      setState(() {
        _image1 = image;
      });
    }
  }

  void imageCallBack2(var image) {
    if (image == null) {
      setState(() {
        _image2 = _image3;
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      if (_image1 == null) {
        setState(() {
          _image1 = image;
        });
      } else {
        setState(() {
          _image2 = image;
        });
      }
    }
  }

  void imageCallBack3(var image) {
    if (image == null) {
      setState(() {
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      if (_image1 == null) {
        setState(() {
          _image1 = image;
        });
      } else if (_image2 == null) {
        setState(() {
          _image2 = image;
        });
      } else {
        setState(() {
          _image3 = image;
        });
      }
    }
  }

  void imageCallBack4(var image) {
    if (image == null) {
      setState(() {
        _image4 = null;
      });
    } else {
      if (_image1 == null) {
        setState(() {
          _image1 = image;
        });
      } else if (_image2 == null) {
        setState(() {
          _image2 = image;
        });
      } else if (_image3 == null) {
        setState(() {
          _image3 = image;
        });
      } else {
        setState(() {
          _image4 = image;
        });
      }
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      // RaisedButton(
                      //   onPressed: getImage,
                      // ),
                      PhotoPicker(
                        image: _image1,
                        imageCallBack: imageCallBack1,
                        photoNum: 1,
                      ),
                      PhotoPicker(
                        image: _image3,
                        imageCallBack: imageCallBack3,
                        photoNum: 3,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      PhotoPicker(
                        image: _image2,
                        imageCallBack: imageCallBack2,
                        photoNum: 2,
                      ),
                      PhotoPicker(
                        image: _image4,
                        imageCallBack: imageCallBack4,
                        photoNum: 4,
                      ),
                    ],
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
