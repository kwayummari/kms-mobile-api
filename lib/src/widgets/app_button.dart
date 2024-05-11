import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPress;
  final String label;
  final Color bcolor;
  final double borderRadius;
  final Color textColor;
  final Color? borderColor;

  const AppButton({
    Key? key,
    required this.onPress,
    required this.label,
    required this.borderRadius,
    required this.textColor,
    required this.bcolor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bcolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderColor != null
                  ? BorderSide(
                      color: borderColor ?? AppConst.transparent,
                      width: 1,
                    )
                  : BorderSide(color: AppConst.transparent, width: 1),
            ),
          ),
        ),
        onPressed: () => onPress(),
        child: AppText(
          txt: label,
          color: textColor,
          size: 15,
        ));
  }
}
