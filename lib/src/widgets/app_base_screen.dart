import 'package:gugu/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppBaseScreen extends StatelessWidget {
  final Widget child;
  final Widget? floatingAction;
  final bool? isLoading;
  final bool? backgroundImage;
  final bool backgroundAuth;
  final AppBar? appBar;
  final bool? isvisible;
  final EdgeInsetsGeometry? padding;
  final Color? bgcolor;

  const AppBaseScreen({
    Key? key,
    required this.child,
    required this.isvisible,
    this.isLoading = false,
    required this.backgroundImage,
    required this.backgroundAuth,
    this.appBar,
    this.padding,
    this.floatingAction,
    this.bgcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor ?? AppConst.black,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          decoration: backgroundAuth
              ? BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/login.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.4),
                )
              : null,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.all(16.0),
                child: child,
              ),
              if (backgroundImage == true)
                Positioned.fill(
                  child: Image.asset(
                    'assets/intro.png',
                    fit: BoxFit.cover,
                  ),
                ),
              if (backgroundAuth == true)
                Container(
                  color: AppConst.black.withOpacity(0.85),
                ),
              if (backgroundImage == true)
                Container(
                  color: AppConst.black.withOpacity(0.85),
                ),
              if (isLoading == true)
                Center(
                    child: SpinKitCircle(
                  color: AppConst.primary,
                )),
              if (isvisible == true)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 130,
                    width: 120,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      color: AppConst.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          bottomLeft: Radius.circular(126),
                          bottomRight: Radius.circular(0)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingAction,
    );
  }
}
