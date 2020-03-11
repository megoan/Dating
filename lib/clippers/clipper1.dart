import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height*0.4);

    path.quadraticBezierTo(size.width*0.5,  size.height*0.4, size.width, size.height*0.1);
    //path.lineTo(size.width, size.height*0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

   
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
  
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height*0.45);

    path.quadraticBezierTo(size.width*0.5,  size.height*0.45, size.width, size.height*0.2);
    //path.lineTo(size.width, size.height*0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

   
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
  
}

class MyClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height*0.5);

    path.quadraticBezierTo(size.width*0.5,  size.height*0.5, size.width, size.height*0.35);
    //path.lineTo(size.width, size.height*0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

   
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
  
}