import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  final Widget child;
  final BorderRadius? radius;
  final double elevation;
  final Color color;

  const AppMaterial(
      {Key? key,
      required this.child,
      this.radius,
      required this.elevation,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: color,
      borderRadius: radius,
      child: child,
    );
  }
}
