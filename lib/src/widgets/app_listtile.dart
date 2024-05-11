import 'package:flutter/material.dart';

class AppListTile extends StatefulWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? trailing;
  final Function? onTap;
  const AppListTile({
    Key? key,
    this.leading,
    this.subTitle,
    this.trailing,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  _AppListTileState createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
        setState(() {
          _isTapped = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.grey.withOpacity(0.5) : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
        child: ListTile(
          leading: widget.leading,
          title: widget.title,
          subtitle: widget.subTitle,
          trailing: widget.trailing,
        ),
      ),
    );
  }
}
