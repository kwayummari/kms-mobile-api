import 'package:flutter/material.dart';
import 'package:kms/src/gateway/user-services.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_listview_builder.dart';
import 'package:kms/src/widgets/app_text.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  void initState() {
    getMenu();
    super.initState();
  }

  List data = [];
  void getMenu() async {
    userService usersService = userService();
    var companyId = '1';
    final datas = await usersService.users(context, companyId);
    setState(() {
      data = datas['users'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        title: AppText(
          txt: 'List of users',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        isFlexible: false,
        showAppBar: true,
        bgcolor: AppConst.white,
        appBarBgColor: AppConst.white,
        iconColor: AppConst.black,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            AppListviewBuilder(
                itemnumber: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: ExpansionTile(
                      leading: Icon(
                        Icons.person_2_rounded,
                        color: AppConst.primary,
                      ),
                      title: AppText(
                        txt: data[index]['fullname'],
                        size: 15,
                        color: AppConst.primary,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Email',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['email'],
                                size: 15,
                                color: AppConst.black,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Phone',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['phone'],
                                size: 15,
                                color: AppConst.black,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Branch name',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['branch'],
                                size: 15,
                                color: AppConst.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}
