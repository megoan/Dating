import 'dart:io';

import 'package:dating/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerFlat extends StatefulWidget {
  File image;
  Function imageCallBack;
  int photoNum = 0;
  bool small = false;
  String imageUrl;
  final double width;
  final double height;
  @override
  _PhotoPickerFlatState createState() => _PhotoPickerFlatState();
  PhotoPickerFlat({this.image, this.imageCallBack, this.photoNum, this.imageUrl, this.small = false, this.width, this.height});
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
                ? Image.network(widget.imageUrl, fit: BoxFit.cover, height: widget.height, width: widget.width)
                : widget.image != null
                    ? Image.file(widget.image, fit: BoxFit.cover, height: widget.height, width: widget.width)
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageButton(image: widget.image, imageCallBack: getCameraImage, iconData: Icons.add_a_photo),
                        ImageButton(
                          image: widget.image,
                          imageCallBack: getGalleryImage,
                          iconData: Icons.image,
                        )
                      ])),
        if (widget.image != null)
          Positioned(bottom: 0,
                      child: Container(
                        
                        decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(5),),
                        child: Column(
              children: <Widget>[
                ImageButton(
                  image: widget.image,
                  imageCallBack: () {
                    widget.imageCallBack(null);
                  },
                  iconData: Icons.close,
                ),
                ImageButton(
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
  ImageButton({this.image, this.imageCallBack, this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        imageCallBack();
      },
      constraints: BoxConstraints(minWidth:40,minHeight:40),
      child: new Icon(iconData, color: Colors.white, size: 20),
      shape: new CircleBorder(),
      elevation: 0,
      fillColor: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(0),
      
    );
  }
}
