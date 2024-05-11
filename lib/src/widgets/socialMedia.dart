import 'package:flutter/material.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_text.dart';

class socialMedia extends StatefulWidget {
  const socialMedia({Key? key}) : super(key: key);

  @override
  State<socialMedia> createState() => _socialMediaState();
}

class _socialMediaState extends State<socialMedia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () => null,
              child: Image.asset(
                'assets/google.png',
                height: 40,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            AppText(
              txt: 'SIGN IN WITH GOOGLE',
              size: 15,
              color: AppConst.grey,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
