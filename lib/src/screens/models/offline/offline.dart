import 'package:flutter/material.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_text.dart';

class offline extends StatefulWidget {
  const offline({super.key});

  @override
  State<offline> createState() => _offlineState();
}

class _offlineState extends State<offline> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      appBar: AppBar(
        title: AppText(
          txt: 'Offline Courses',
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
            txt: 'You do not have any offline courses!!',
            size: 20,
            weight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
