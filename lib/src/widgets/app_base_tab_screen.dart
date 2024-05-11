import 'package:gugu/src/utils/app_const.dart';
import 'package:flutter/material.dart';

class AppBaseTabScreen extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;

  const AppBaseTabScreen(
      {Key? key, required this.child, this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/logo.jpeg"),
              fit: BoxFit.fitWidth,
              colorFilter: ColorFilter.mode(
                  AppConst.black.withOpacity(0.2), BlendMode.dstATop),
            ),
          ),
          child: child),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
