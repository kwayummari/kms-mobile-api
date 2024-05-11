import 'package:flutter/material.dart';

class AppMessages {
  AppMessages._();

  static showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static showError(BuildContext context, String message,
      {bool autoClose = false}) {
    if (message.isEmpty) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration:
          autoClose ? const Duration(seconds: 5) : const Duration(days: 365),
      action: SnackBarAction(
        label: "CLOSE",
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
      content: Row(
        children: [
          Flexible(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: message,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    ));
  }

  static Future<bool?> appConfirm(
      BuildContext context, String title, String message) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
