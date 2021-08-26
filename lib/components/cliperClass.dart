import 'package:flutter/material.dart';

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    var firstControlPoint= Offset(size.width*0.95, size.height*0.10);
    var firstEndPoint=Offset(size.width*0.80, size.height*0.10);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width*0.15, size.height*0.10);

    var secondControlPoint=Offset(size.width*0.05, size.height*0.10);
    var secondEndPoint=Offset(0, size.height*0.20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
