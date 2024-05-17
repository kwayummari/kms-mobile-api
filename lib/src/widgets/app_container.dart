import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double bottom;
  final Decoration? decoration;
  const AppContainer(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.decoration,
      required this.bottom,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottom),
        child: child,
      ),
    );
  }
}
