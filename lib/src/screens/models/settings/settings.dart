import 'package:flutter/material.dart';
import 'package:gugu/src/screens/models/settings/account/account.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  Future<void> phonecall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '0743469680',
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      appBar: AppBar(
        title: AppText(
          txt: 'Settings',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => account()));
            },
            leading: Icon(Icons.person),
            title: AppText(
              txt: 'Your Account',
              size: 15,
              weight: FontWeight.bold,
            ),
            subtitle: AppText(
                txt:
                    'See information about your account,download an archive of your data, or learn about your account deactivation options.',
                size: 14),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context)
              //   .push(MaterialPageRoute(builder: (context) => Language()));
            },
            leading: Icon(Icons.language),
            title: AppText(
              txt: 'Language',
              size: 15,
              weight: FontWeight.bold,
            ),
            subtitle: AppText(
                txt:
                    'Choose the language you prefer to use in the application. The language chosen will affect all content of the app.',
                size: 14),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () => phonecall(),
            leading: Icon(Icons.phone),
            title: AppText(
              txt: 'Contact us',
              size: 15,
              weight: FontWeight.bold,
            ),
            subtitle: AppText(
                txt:
                    'Communicate through our office phone number incase of any emergency.',
                size: 14),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
