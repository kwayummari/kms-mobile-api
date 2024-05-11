import 'package:flutter/material.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_text.dart';

class courses extends StatefulWidget {
  const courses({super.key});

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      appBar: AppBar(
        title: AppText(
          txt: 'Enrolled Courses',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Divider(
            color: AppConst.black,
          ),
          SizedBox(
            height: 20,
          ),
          AppText(
            txt: 'You do not have any enrolled courses!!',
            size: 20,
            weight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
