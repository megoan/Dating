import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'loader.dart';
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });
  _launchWhatsApp() async {
  String phoneNumber = '+97252981797';
  String message = 'hello from flutter app!!';
  var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
sendEmail() async {
    var url = 'mailto:shmuelsoib@gmail.com?subject=database&body=hello';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
  padding: EdgeInsets.only(
    top: (66 + 16.0),
    bottom: 16,
    left: 16,
    right: 16,
  ),
  margin: EdgeInsets.only(top: 66),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 16.0),
      // Text(
      //   description,
      //   textAlign: TextAlign.center,
      //   style: TextStyle(
      //     fontSize: 16.0,
      //   ),
      // ),
      SizedBox(height: 24.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: (){
              _launchWhatsApp();
            },
            child: Image.asset("assets/images/whatsapp.png",width: 40,height: 40,)),
          InkWell(
            onTap: (){
              sendEmail();
            },
            child: Image.asset("assets/images/gmail.png",width: 40,height: 40,)),
         
        ],
      ),
      // Align(
      //   alignment: Alignment.bottomRight,
      //   child: FlatButton(
      //     onPressed: () {
      //       Navigator.of(context).pop(); // To close the dialog
      //     },
      //     child: Text(buttonText),
      //   ),
      // ),
    ],
  ),
),
      Positioned(
  left: 16,
  right: 16,
  child:Hero(
      tag: "shadchanImage",
                                        child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            width: 130,
            height: 130,
            child: CircleAvatar(
              radius: 130,
              backgroundColor:
                  Theme.of(context).primaryColor,
            ),
          ),
          Container(
            width:120,
            height: 120,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://placeimg.com/640/480/any',
                placeholder: (context, url) => Loader(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ),
          ),
         
        ],
      ),
      )),
    ],
  );
}
}

