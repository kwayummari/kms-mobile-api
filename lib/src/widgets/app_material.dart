import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  final Widget child;

  const AppMaterial(
      {Key? key, required this.child,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: child,
    );
  }
}
