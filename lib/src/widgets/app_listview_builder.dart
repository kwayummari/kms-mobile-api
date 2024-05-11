import 'package:flutter/material.dart';

class AppListviewBuilder extends StatelessWidget {
  final bool disabled;
  final int itemnumber;
  final Axis direction;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const AppListviewBuilder(
      {Key? key,
      this.direction = Axis.vertical,
      this.disabled = false,
      required this.itemnumber,
      required this.itemBuilder,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return itemnumber != 0 // Check if itemnumber is not zero
        ? ListView.builder(
            scrollDirection: direction,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: itemBuilder,
            itemCount: itemnumber,
          )
        : Container();
  }
}
