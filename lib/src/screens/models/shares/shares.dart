import 'package:flutter/material.dart';
import 'package:kms/src/screens/models/shares/sharesCard.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_text.dart';

class Shares extends StatefulWidget {
  const Shares({super.key});

  @override
  State<Shares> createState() => _SharesState();
}

class _SharesState extends State<Shares> {
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
        txt: 'Shares',
        size: 20,
        color: AppConst.white,
      ),
      child: Column(
        children: [
          SharesCard(),
        ],
      ),
    );
  }
}
