import 'package:flutter/material.dart';
import 'package:kms/src/functions/iconData.dart';
import 'package:kms/src/gateway/menu-services.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/utils/routes/route-names.dart';
import 'package:kms/src/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class appDrawer extends StatefulWidget {
  const appDrawer({Key? key});

  @override
  State<appDrawer> createState() => _appDrawerState();
}

class _appDrawerState extends State<appDrawer> {
  void initState() {
    getMenu();
    super.initState();
  }

  var role;
  List data = [];
  void getMenu() async {
    menuService MenuService = menuService();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('role');
    var roleName = sharedPreferences.getString('rolesName');
    final datas = await MenuService.menu(context, id!);
    setState(() {
      data = datas['contents'];
      role = roleName;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox.fromSize(
            size: Size.fromRadius(50),
            child: Image.asset('assets/2.png', fit: BoxFit.fill),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AppText(
          txt: role ?? '',
          size: 15,
          color: AppConst.primary,
        ),
        AppText(
          txt: 'Aurorawave Labs Ltd',
          size: 15,
          color: AppConst.black,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: AppConst.grey400,
        ),
        data.isEmpty
            ? CircularProgressIndicator()
            : Column(
                children: data.map<Widget>((menuItem) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ExpansionTile(
                      leading: Icon(
                        getIconData(menuItem['icon']),
                        color: AppConst.primary,
                      ),
                      title: AppText(
                        txt: menuItem['name'],
                        size: 15,
                        color: AppConst.primary,
                      ),
                      children: menuItem['submenu'] != null
                          ? menuItem['submenu'].map<Widget>((subMenu) {
                              return ListTile(
                                title: AppText(
                                  txt: subMenu['name'],
                                  size: 15,
                                  color: AppConst.black,
                                ),
                                onTap: () {
                                  // Handle submenu tap
                                },
                              );
                            }).toList()
                          : [],
                    ),
                  );
                }).toList(),
              ),
        Spacer(),
        ListTile(
          leading: Icon(
            Icons.logout,
          ),
          title: AppText(
            txt: 'Logout',
            size: 15,
            color: AppConst.black,
          ),
          onTap: () async {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            await sharedPreferences.clear();
            Navigator.pushReplacementNamed(context, RouteNames.login);
          },
        ),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}
