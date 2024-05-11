import 'package:flutter/material.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_text.dart';

class AppCourseDetails extends StatelessWidget {
  final Icon icon;
  final String text;

  const AppCourseDetails({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20,
          ),
          AppText(
            txt: text,
            size: 20,
            weight: FontWeight.w600,
            color: AppConst.black,
          ),
        ],
      ),
    );
  }
}
