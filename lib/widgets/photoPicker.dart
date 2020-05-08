import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
class PhotoPicker extends StatefulWidget {
  File image;
  Function imageCallBack;
  int photoNum=0;
  bool small=false;
  String imageUrl;
  @override
  _PhotoPickerState createState() => _PhotoPickerState();
  PhotoPicker({this.image,this.imageCallBack,this.photoNum,this.imageUrl,this.small=false});
}

class _PhotoPickerState extends State<PhotoPicker> {
   Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    widget.imageCallBack(image);
    // setState(() {
    //  //widget.image = image;
     
    //  //widget.imageCallBack(image);
    // });
  }
    Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
     widget.imageCallBack(image);
    // setState(() {
    //  //widget.image = image;
    
    // });
  }

  Future cropImage() async {
    var image = await ImageCropper.cropImage(
      sourcePath: widget.image.path,
      aspectRatio: CropAspectRatio(ratioX: 1,ratioY: 1),
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   // CropAspectRatioPreset.ratio3x2,
      //   // CropAspectRatioPreset.original,
      //   // CropAspectRatioPreset.ratio4x3,
      //   // CropAspectRatioPreset.ratio16x9
      // ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          //toolbarColor: Theme.of(context).primaryColor,
          //toolbarWidgetColor: Colors.white,
          //initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          //toolbarWidgetColor:Theme.of(context).primaryColor
          ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      )
    );
     if(image!=null){
       //widget.image=image;
       widget.imageCallBack(image);
     }
    // setState(() {
    
    // });
    
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
                        children: <Widget>[
                          Stack(
                             alignment: AlignmentDirectional.center,
                            children: <Widget>[
                               Container(
                                width: (widget.small)?120:150,
                                height: (widget.small)?120:150,
                                child: CircleAvatar(radius: 140,
                                //backgroundColor: Theme.of(context).primaryColor,
                                ),
                              ),
                              Container(
                                width: (widget.small)?112:140,
                                height:(widget.small)?112:140,
                                child: widget.image!=null?CircleAvatar(backgroundImage:widget.imageUrl!=null?Image.network(widget.imageUrl): new FileImage(widget.image), radius: (widget.small)?112:140,):CircleAvatar(
                                  //backgroundColor: Colors.grey,
                                  radius: (widget.small)?112:140,)
                              ),
                             
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(0.0),
                          //   child: Container(
                          //     child: (widget.image==null)?null:Image.file(widget.image),
                          //     width: 140.0,
                          //     height: 140.0,
                          //     decoration: new BoxDecoration(
                          //       color:  Colors.black12,
                          //     //   image: (widget.image==null)?null:new DecorationImage(
                          //     //     image:  Image.file(widget.image)
                          //     //  )
                          //     //  ,
                          //       borderRadius: new BorderRadius.all(
                          //           new Radius.circular(70.0)),
                          //       border: new Border.all(
                          //         color: Theme.of(context).primaryColor,
                          //         width: 4.0,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          if(widget.photoNum!=null)ImageNumberIcon(top: (widget.small)?-5:-5, right:  (widget.small)?-20:-20,number:widget.photoNum,),
                         (widget.image==null)? ImageButton( small: widget.small ,bottom: (widget.small)?-5:-5, right: (widget.small)?-20:-20,image: widget.image,imageCallBack: getCameraImage,iconData:Icons.add_a_photo):
                         ImageButton(small: widget.small ,bottom:  (widget.small)?-5:-5, right: -20,image: widget.image,imageCallBack: (){widget.imageCallBack(null);},iconData:Icons.close ,),
                         
                         (widget.image==null)? ImageButton(small: widget.small ,bottom:  (widget.small)?-5:-5, left: (widget.small)?-20:-20,image: widget.image,imageCallBack: getGalleryImage,iconData:Icons.image ,):
                         ImageButton( small: widget.small ,bottom:  (widget.small)?-5:-5, left: (widget.small)?-20:-20,image: widget.image,imageCallBack: cropImage,iconData:Icons.crop ,),
                          
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
   bool small = false;
   ImageButton({this.right,this.left,this.top,this.bottom,this.image,this.imageCallBack,this.iconData,this.small}) ;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
       child: RawMaterialButton(
         onPressed: () {
           imageCallBack();
         },
         child: new Icon(
           iconData,
           //color: Colors.white,
           size: (small)?15:20
         ),
         shape: new CircleBorder(),
         elevation: 0,
         //fillColor: Theme.of(context).primaryColor,
         padding: const EdgeInsets.all(0),
       ),
     );
  }
}
class ImageNumberIcon extends StatelessWidget {
  int number;
   double top;
   double left;
   double right;
   double bottom;
  ImageNumberIcon({this.right,this.left,this.top,this.bottom,this.number});
    @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
       child: RawMaterialButton(
         onPressed: () {
           
         },
         child: Text(number.toString(),style: TextStyle(
           //color: Colors.white,
           fontWeight: FontWeight.bold),),
         shape: new CircleBorder(),
         elevation: 0,
         //fillColor: Theme.of(context).primaryColor,
         padding: const EdgeInsets.all(0),
       ),
     );
  }
}
