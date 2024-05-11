import 'package:gugu/src/screens/models/available_courses/available_courses.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_input_text.dart';
import 'package:flutter/material.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  var fullname;
  @override
  void initState() {
    getName();
    super.initState();
  }

  Future<String> getName() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var name = sharedPreferences.getString('name');
    setState(() {
      fullname = name.toString();
    });
    return name.toString();
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConst.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          toolbarHeight: 200,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: AppConst.white,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: AppConst.primary,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AppText(
                      txt: 'Welcome \n${fullname}',
                      size: 18,
                      weight: FontWeight.w600,
                      color: AppConst.white,
                    ),
                    Spacer(),
                    Icon(
                      Icons.notifications_none_sharp,
                      color: AppConst.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: AppInputText(
                    circle: 15,
                    textfieldcontroller: search,
                    ispassword: false,
                    isemail: false,
                    fillcolor: AppConst.white,
                    label: 'Search Style',
                    textsColor: AppConst.black,
                    obscure: false,
                    icon: Icon(
                      Icons.search,
                      color: AppConst.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  AppText(
                    txt: 'Available Hair Styles',
                    size: 15,
                    color: AppConst.black,
                    weight: FontWeight.w700,
                  ),
                  Spacer(),
                  AppText(
                    txt: 'View All',
                    size: 15,
                    color: AppConst.black,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppConst.black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            availableCourses(),
            // SizedBox(
            //   height: 20,
            // ),
            // topSearch()
          ],
        ));
  }
}
