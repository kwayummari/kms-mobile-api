import 'package:flutter/material.dart';

class AppVisibility extends StatelessWidget {
  final Widget child;
  final bool visible;
  const AppVisibility({Key? key, required this.child, required this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: child
      );
  }
}