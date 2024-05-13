import 'package:flutter/material.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_text.dart';

class courses extends StatefulWidget {
  const courses({super.key});

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      title: AppText(
          txt: 'Enrolled Courses',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      padding: EdgeInsets.all(0),
      isFlexible: false,
      showAppBar: true,
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
