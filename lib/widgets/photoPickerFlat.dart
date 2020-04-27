import 'dart:io';

import 'package:dating/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerFlat extends StatefulWidget {
  File image;
  Function imageCallBack;
  int photoNum = 0;
  bool small ;
  String imageUrl;
  final double width;
  final double height;
  @override
  _PhotoPickerFlatState createState() => _PhotoPickerFlatState();
  PhotoPickerFlat({this.image, this.imageCallBack, this.photoNum, this.imageUrl, this.small = true, this.width, this.height});
}

class _PhotoPickerFlatState extends State<PhotoPickerFlat> {
  Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    widget.imageCallBack(image);
  }

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    widget.imageCallBack(image);
  }

  Future cropImage() async {
    var image = await ImageCropper.cropImage(
        sourcePath: widget.image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (image != null) {
      widget.imageCallBack(image);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.primary),
              color: Colors.black12,
            ),
            width: widget.width ?? widget.width,
            height: widget.height ?? widget.height,
            child: widget.imageUrl != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover, height: widget.height, width: widget.width))
                : widget.image != null
                    ? ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                      child: Image.file(widget.image, fit: BoxFit.cover, height: widget.height, width: widget.width))
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageButton(small: widget.small,image: widget.image, imageCallBack: getCameraImage, iconData: Icons.add_a_photo),
                        ImageButton(
                          small: widget.small,
                          image: widget.image,
                          imageCallBack: getGalleryImage,
                          iconData: Icons.image,
                        )
                      ])),
        if (widget.image != null)
          widget.small?
          
          Positioned(bottom: 0,right: 0,child: Container(
            width: 40,
            height: 40,
            decoration:BoxDecoration(color: AppTheme.primary, 
            borderRadius:BorderRadius.only( topLeft: Radius.circular(30)),),
            child: ImageButton(
                  small: widget.small,
                  image: widget.image,
                  imageCallBack: () {
                    widget.imageCallBack(null);
                  },
                  iconData: Icons.close,
                ),
          ),)

          :Positioned(bottom: 0,right: 0,
                      child: Container(
                        
                        decoration:BoxDecoration(color: AppTheme.primary, 
            borderRadius:BorderRadius.only( topLeft: Radius.circular(20)),),
                        child: Column(
              children: <Widget>[
                ImageButton(
                  small: widget.small,
                  image: widget.image,
                  imageCallBack: () {
                    widget.imageCallBack(null);
                  },
                  iconData: Icons.close,
                ),
                ImageButton(
                  small: widget.small,
                  image: widget.image,
                  imageCallBack: cropImage,
                  iconData: Icons.crop,
                ),
              ],
            ),
                      ),
          ),
      ],
    );
  }
}

class ImageButton extends StatelessWidget {
  File image;
  Function imageCallBack;
  IconData iconData;
  bool small;
  Color color  ;
  ImageButton({this.image, this.imageCallBack, this.iconData,this.color = AppTheme.primary ,this.small = true});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        imageCallBack();
      },
      constraints: small?BoxConstraints(minWidth:35,minHeight:35):  BoxConstraints(minWidth:40,minHeight:40),
      child: new Icon(iconData, color: Colors.white, size: small?  16:20),
      shape: new CircleBorder(),
      elevation: 0,
      fillColor:color,
      padding: const EdgeInsets.all(0),
      
    );
  }
}