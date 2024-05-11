import 'package:gugu/src/functions/clipPath.dart';
import 'package:gugu/src/functions/slide.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_button.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final Color backgroundColor;
  final String? centerText;
  final String image;

  Slide({
    Key? key,
    required this.backgroundColor,
    required this.centerText,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: BottomRoundedClipper(),
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height /
                2, // Adjust the height here
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AppText(
            align: TextAlign.center,
            txt: centerText,
            size: 25,
            weight: FontWeight.w700,
            color: AppConst.white,
          ),
        ),
        SizedBox(
          height: 80,
        ),
        AppButton(
          onPress: () => SlideFunction().login(context),
          label: "Skip",
          borderRadius: 20,
          textColor: AppConst.white,
          bcolor: AppConst.primary,
        )
      ],
    );
  }
}
