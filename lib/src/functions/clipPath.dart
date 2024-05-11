import 'package:flutter/material.dart';

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = 100.0;
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}