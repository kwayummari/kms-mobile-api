import 'package:gugu/src/functions/splash.dart';
import 'package:gugu/src/gateway/profile-service.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var data;
  void fetchData() async {
    profileService ProfileService = profileService();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('id');
    final datas = await ProfileService.profile(context, id!);
    setState(() {
      data = datas['user'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: Container(
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: AppText(
                  txt: data != null ? data[0]['full_name'] : 'loading...',
                  size: 25,
                  color: AppConst.white,
                  weight: FontWeight.w900,
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppConst.primary,
                    ),
                    AppText(
                      txt: '5.0',
                      size: 15,
                      color: AppConst.grey,
                    )
                  ],
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppConst.primary,
                  child: Icon(
                    Icons.person,
                    color: AppConst.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConst.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.help,
                          size: 30,
                          color: AppConst.primary,
                        ),
                        AppText(
                          txt: 'Help',
                          size: 15,
                          color: AppConst.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConst.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.settings,
                          size: 30,
                          color: AppConst.primary,
                        ),
                        AppText(
                          txt: 'Settings',
                          size: 15,
                          color: AppConst.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConst.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.logout,
                          size: 30,
                          color: AppConst.primary,
                        ),
                        AppText(
                          txt: 'Sign Out',
                          size: 15,
                          color: AppConst.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppConst.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: AppConst.white,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: AppText(
                      txt: 'Safety check-up',
                      size: 15,
                      weight: FontWeight.w900,
                    ),
                    subtitle: AppText(
                        txt:
                            'From planning your route to tracking your bus, our daladala app does it all - download it now!',
                        size: 15),
                    trailing: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/ads.jpg'),
                    ),
                  ),
                ),
              ),
              Divider(
                color: AppConst.grey,
                thickness: 3,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: data != null ? data[0]['full_name'] : 'loading...',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
                trailing: IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.edit,
                      color: AppConst.grey,
                    )),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: data != null ? data[0]['phone_number'] : 'loading...',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
                trailing: IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.edit,
                      color: AppConst.grey,
                    )),
              ),
              ListTile(
                leading: Icon(
                  Icons.security,
                  color: AppConst.white,
                ),
                title: AppText(
                  txt: 'Legal',
                  color: AppConst.white,
                  size: 15,
                  weight: FontWeight.w900,
                ),
              )
            ],
          ),
        ));
  }
}
