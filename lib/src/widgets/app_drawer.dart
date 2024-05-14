import 'package:flutter/material.dart';
import 'package:kms/src/gateway/menu-services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class appDrawer extends StatefulWidget {
  const appDrawer({super.key});

  @override
  State<appDrawer> createState() => _appDrawerState();
}

class _appDrawerState extends State<appDrawer> {
  void initState() {
    getMenu();
    super.initState();
  }

  List data = [];
  void getMenu() async {
    menuService MenuService = menuService();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('role');
    final datas = await MenuService.menu(context, id!);
    setState(() {
      data = datas['contents'];
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
