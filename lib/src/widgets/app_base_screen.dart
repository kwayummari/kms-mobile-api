import 'package:kms/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kms/src/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBaseScreen extends StatefulWidget {
  final Widget child;
  final Widget? title;
  final Widget? floatingAction;
  final bool? isLoading;
  final bool? backgroundImage;
  final bool backgroundAuth;
  final AppBar? appBar;
  final bool? isvisible;
  final bool? isFlexible;
  final bool? showAppBar;
  final bool? centerTitle;
  final EdgeInsetsGeometry? padding;
  final Color? bgcolor;
  final Color? appBarBgColor;
  final Color? iconColor;

  const AppBaseScreen(
      {Key? key,
      required this.child,
      required this.isvisible,
      required this.isFlexible,
      required this.showAppBar,
      this.isLoading = false,
      required this.backgroundImage,
      required this.backgroundAuth,
      this.appBar,
      this.padding,
      this.floatingAction,
      this.title,
      this.bgcolor,
      this.appBarBgColor,
      this.iconColor,
      this.centerTitle})
      : super(key: key);

  @override
  State<AppBaseScreen> createState() => _AppBaseScreenState();
}

class _AppBaseScreenState extends State<AppBaseScreen> {
  var fullname;
  var roles;
  OverlayEntry? sideSheetOverlayEntry;
  final sideSheetOverlayLayerLink = LayerLink();
  bool isSidebarShown = false;
  @override
  void initState() {
    getName();
    super.initState();
  }

  Future<String> getName() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var name = sharedPreferences.getString('fullname');
    var role = sharedPreferences.getString('rolesName');
    setState(() {
      fullname = name.toString();
      roles = role.toString();
    });
    return name.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgcolor ?? AppConst.black,
      drawer: Drawer(),
      appBar: widget.showAppBar == true
          ? AppBar(
              centerTitle: widget.centerTitle,
              title: Padding(
                padding: EdgeInsets.only(
                    bottom: widget.isFlexible == true ? 150 : 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: widget.title,
                ),
              ),
              actions: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications_none_sharp,
                      color: widget.iconColor ?? AppConst.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
              flexibleSpace: widget.isFlexible == true
                  ? Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: AppConst.white,
                                child: AppText(
                                  txt: fullname == null
                                      ? ''
                                      : fullname
                                          .split(' ')
                                          .map((word) => word[0].toUpperCase())
                                          .join(''),
                                  size: 20,
                                  weight: FontWeight.w900,
                                  color: AppConst.primary,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              AppText(
                                txt: 'Welcome \n${fullname} (${roles})',
                                size: 15,
                                weight: FontWeight.w600,
                                color: AppConst.white,
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  : null,
              iconTheme:
                  IconThemeData(color: widget.iconColor ?? AppConst.white),
              shape: widget.isFlexible == true
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    )
                  : null,
              leading: Align(
                alignment: Alignment.topLeft,
                child: Builder(
                  builder: (BuildContext context) {
                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ],
                    );
                  },
                ),
              ),
              leadingWidth: 50, // Adjust this value according to your needs
              toolbarHeight: widget.isFlexible == true ? 200 : null,
              backgroundColor: widget.appBarBgColor ?? AppConst.primary,
            )
          : null,
      body: SingleChildScrollView(
        child: Container(
          decoration: widget.backgroundAuth
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
                padding: widget.padding ?? const EdgeInsets.all(16.0),
                child: widget.child,
              ),
              if (widget.backgroundImage == true)
                Positioned.fill(
                  child: Image.asset(
                    'assets/intro.png',
                    fit: BoxFit.cover,
                  ),
                ),
              if (widget.backgroundAuth == true)
                Container(
                  color: AppConst.black.withOpacity(0.85),
                ),
              if (widget.backgroundImage == true)
                Container(
                  color: AppConst.black.withOpacity(0.85),
                ),
              if (widget.isLoading == true)
                Center(
                    child: SpinKitCircle(
                  color: AppConst.primary,
                )),
              if (widget.isvisible == true)
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
      floatingActionButton: widget.floatingAction,
    );
  }
}
