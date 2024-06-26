// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  // final Widget child;
  final String? txt;
  final TextAlign? align;
  final TextOverflow? overflow;
  var color;
  var weight;
  double size;
  TextDecoration? textdecoration;
  final bool? softWrap;
  AppText(
      {Key? key,
      required this.txt,
      this.color,
      this.align,
      this.weight,
      this.textdecoration,
      this.overflow,
      required this.size,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt.toString(),
      textAlign: align ?? null,
      softWrap: softWrap,
      overflow: overflow ?? null,
      style: TextStyle(
        decoration: textdecoration,
        color: color,
        fontSize: size,
        fontFamily: 'OpenSans',
        fontWeight: weight,
      ),
    );
  }
}
