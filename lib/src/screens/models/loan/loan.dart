// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kms/src/screens/models/loan/loanCards.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/utils/routes/route-names.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_base_stepper.dart';
import 'package:kms/src/widgets/app_button.dart';
import 'package:kms/src/widgets/app_text.dart';

class Loan extends StatefulWidget {
  Loan({Key? key}) : super(key: key);

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
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
        txt: 'Loan',
        size: 20,
        color: AppConst.white,
      ),
      child: Column(
        children: [
          LoanCards(),
          AppButton(
            onPress: () {
              Navigator.pushNamed(
                context,
                RouteNames.loanApplication,
                arguments: (_) => false,
              );
            },
            label: 'New Loan Application',
            borderRadius: 20,
            textColor: AppConst.whiteOpacity,
            bcolor: AppConst.primary,
          ),
        ],
      ),
    );
  }
}
