import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class PhotoPicker extends StatefulWidget {
  File image;
  Function imageCallBack;
  @override
  _PhotoPickerState createState() => _PhotoPickerState();

  PhotoPicker({this.image,this.imageCallBack});
}

class _PhotoPickerState extends State<PhotoPicker> {
   Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
     widget.image = image;
    widget.imageCallBack(image);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: new BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: new DecorationImage(
                                  image: (widget.image!=null)? ExactAssetImage(widget.image.path):AssetImage('assets/images/grey.jpg'),
                                ),
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(70.0)),
                                border: new Border.all(
                                  color: Theme.of(context).accentColor,
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                          ImageButton(top: 10,right: -5,image: widget.image,imageCallBack: (){},iconData:Icons.delete ,),
                          ImageButton( bottom: 10, right: -5,image: widget.image,imageCallBack: (){},iconData:Icons.add_a_photo),
                          ImageButton( bottom: 10, left: -5,image: widget.image,imageCallBack: (){},iconData:Icons.image ,),
                          
                        ],
                      )
                     ;
  }
}

class ImageButton extends StatelessWidget {
   double top;
   double left;
   double right;
   double bottom;
   File image;
   Function imageCallBack;
   IconData iconData;
   ImageButton({this.right,this.left,this.top,this.bottom,this.image,this.imageCallBack,this.iconData}) ;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
       child: RawMaterialButton(
         onPressed: () {
           imageCallBack(image);
         },
         child: new Icon(
           iconData,
           color: Colors.blue,
           size: 20.0,
         ),
         shape: new CircleBorder(),
         elevation: 2.0,
         fillColor: Colors.white,
         padding: const EdgeInsets.all(0),
       ),
     );
  }
}