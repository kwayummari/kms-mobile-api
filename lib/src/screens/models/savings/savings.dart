// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kms/src/screens/models/savings/savingsCard.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_text.dart';

class Savings extends StatefulWidget {
  Savings({Key? key}) : super(key: key);

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  @override
  void initState() {
    super.initState();
  }

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
        txt: 'Savings',
        size: 20,
        color: AppConst.white,
      ),
      child: Column(
        children: [
          SavingsCard(),
        ],
      ),
    );
  }
}
