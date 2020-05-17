import 'dart:io';

import 'package:dating/themes/appTheme.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerFlat extends StatefulWidget {
  File image;
  Function imageCallBack;
Function validator;
  bool small;
  bool circle;
  String imageUrl;
  final double width;
  final double height;
  @override
  _PhotoPickerFlatState createState() => _PhotoPickerFlatState();
  PhotoPickerFlat({this.image, this.imageCallBack, this.imageUrl, this.small = true, this.width, this.height,this.validator, this.circle = false});
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
          //toolbarColor: Theme.of(context).primaryColor,
          //toolbarWidgetColor: Colors.white,
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
    return FormField(
      builder: (FormFieldState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          
          widget.circle
              ? Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(border: 
                        state.hasError ?
                        Border.all(color: Colors.red[300], width: widget.imageUrl == null && widget.image == null ? 1.5 : 2.5)
                        :Border.all(color: ColorManager().theme.primary, width: widget.imageUrl == null && widget.image == null ? 1.5 : 2.5), 
                        
                        shape: BoxShape.circle),
                        width: (widget.small) ? 110 : 140,
                        height: (widget.small) ? 110 : 140,
                        child: widget.image != null
                            ? CircleAvatar(
                                backgroundColor: Colors.black12,
                                backgroundImage: widget.imageUrl != null ? Image.network(widget.imageUrl) : new FileImage(widget.image),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.black12,
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  ImageButton(small: widget.small, image: widget.image, imageCallBack: getCameraImage, iconData: Icons.add_a_photo),
                                  ImageButton(
                                    small: widget.small,
                                    image: widget.image,
                                    imageCallBack: getGalleryImage,
                                    iconData: Icons.image,
                                  )
                                ]),
                              )),
                    if (widget.image != null || widget.imageUrl != null)
                      Positioned(
                        bottom: widget.circle ? 5 : 0,
                        right: widget.circle ? 5 : 0,
                        child: Container(
                          width: widget.circle ? 30 : 40,
                          height: widget.circle ? 30 : 40,
                          decoration: BoxDecoration(
                            color: ColorManager().theme.primary,
                            borderRadius: widget.circle
                                ? BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                                : BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(5)),
                          ),
                          child: ImageButton(
                            small: widget.small,
                            image: widget.image,
                            imageCallBack: () {
                              widget.imageCallBack(null);
                            },
                            iconData: Icons.close,
                          ),
                        ),
                      ),
                    if (widget.image != null || widget.imageUrl != null)
                      Positioned(
                        bottom: widget.circle ? 5 : 0,
                        left: widget.circle ? 5 : 0,
                        child: Container(
                          width: widget.circle ? 30 : 40,
                          height: widget.circle ? 30 : 40,
                          decoration: BoxDecoration(
                            color: ColorManager().theme.primary,
                            borderRadius: widget.circle
                                ? BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
                                : BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(5),
                                  ),
                          ),
                          child: ImageButton(
                            small: widget.small,
                            image: widget.image,
                            imageCallBack: cropImage,
                            iconData: Icons.crop,
                          ),
                        ),
                      ),
                  ],
                )
              : Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: state.hasError ?
                          Border.all(color:Colors.red[300], width: widget.imageUrl == null && widget.image == null ? 1.5 : 2.5)
                          : Border.all(color: ColorManager().theme.primary, width: widget.imageUrl == null && widget.image == null ? 1.5 : 2.5),
                          color: Colors.black12,
                        ),
                        width: widget.width ?? widget.width,
                        height: widget.height ?? widget.height,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: widget.imageUrl != null
                                ? Image.network(widget.imageUrl, fit: BoxFit.cover, height: widget.height, width: widget.width)
                                : widget.image != null
                                    ? Image.file(widget.image, fit: BoxFit.cover, height: widget.height, width: widget.width)
                                    : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                        ImageButton(small: widget.small, image: widget.image, imageCallBack: getCameraImage, iconData: Icons.add_a_photo),
                                        ImageButton(
                                          small: widget.small,
                                          image: widget.image,
                                          imageCallBack: getGalleryImage,
                                          iconData: Icons.image,
                                        )
                                      ]))),
                    if (widget.image != null || widget.imageUrl != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager().theme.primary,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                          ),
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
                ),
                SizedBox(height:5),
          state.hasError ? Text(state.errorText, style: TextStyle(color:Colors.red[300] ),) : Container()
        ]);
      },
      validator: widget.validator,
    );
  }
}

class ImageButton extends StatelessWidget {
  File image;
  Function imageCallBack;
  IconData iconData;
  bool small;
  Color color;
  ImageButton({this.image, this.imageCallBack, this.iconData, this.color, this.small = true}) {
    if (this.color == null) {
      //this.color = ColorManager().theme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        imageCallBack();
      },
      constraints: small ? BoxConstraints(minWidth: 35, minHeight: 35) : BoxConstraints(minWidth: 40, minHeight: 40),
      child: new Icon(iconData, color: Colors.white, size: small ? 16 : 20),
      shape: new CircleBorder(),
      elevation: 0,
      fillColor: color,
      padding: const EdgeInsets.all(0),
    );
  }
}
