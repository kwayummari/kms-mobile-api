import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final Widget contents;

   const CustomPopup({Key? key, required this.title, required this.contents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: contents,
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
