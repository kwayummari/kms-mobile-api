import 'package:kms/src/screens/models/dashboard/cardStats.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:kms/src/widgets/app_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        bgcolor: AppConst.white,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        padding: EdgeInsets.all(0),
        isFlexible: true,
        showAppBar: true,
        title: AppText(
          txt: 'Dashboard',
          size: 20,
          color: AppConst.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CardsStatus()
            // availableCourses(),
            // SizedBox(
            //   height: 20,
            // ),
            // topSearch()
          ],
        ));
  }
}
