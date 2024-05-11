import 'package:gugu/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:gugu/src/widgets/app_text.dart';

class AppInputText extends StatelessWidget {
  final TextEditingController? textfieldcontroller;
  final String? label;
  final Icon? icon;
  final Color? fillcolor;
  final Color? textsColor;
  final IconButton? suffixicon;
  final bool obscure;
  final Function? validate;
  final Function(String)? onChange;
  final bool ispassword;
  final bool isemail;
  final bool? enabled;
  final bool? isPhone;
  final double? circle;
  final labelWeight;
  AppInputText(
      {Key? key,
      this.isPhone,
      required this.textfieldcontroller,
      required this.ispassword,
      required this.isemail,
      required this.fillcolor,
      this.textsColor,
      this.icon,
      this.suffixicon,
      this.onChange,
      required this.label,
      required this.obscure,
      this.validate,
      this.enabled,
      this.circle,
      this.labelWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        enabled: enabled ?? true,
        style: TextStyle(color: textsColor ?? AppConst.white),
        onChanged: onChange,
        obscureText: obscure,
        obscuringCharacter: '*',
        controller: textfieldcontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circle ?? 5.0),
          ),
          label: Container(
            color: fillcolor,
            child: AppText(
              txt: label,
              size: 15,
              weight: labelWeight ?? FontWeight.w700,
              color: textsColor ?? AppConst.white,
            ),
          ),
          filled: true,
          fillColor: fillcolor,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circle ?? 5.0),
            borderSide: BorderSide(color: AppConst.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circle ?? 5.0),
            borderSide: BorderSide(color: AppConst.black),
          ),
          prefixIcon: icon,
          suffixIcon: suffixicon,
        ),
        validator: (value) {
          String pattern = r'([0][6,7]\d{8})';
          RegExp passwordRegex = new RegExp(pattern);
          RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');
          if (ispassword == true && isemail == false && isPhone == false) {
            if (value!.isNotEmpty) {
              if (!regex.hasMatch(value)) {
                return 'Password should contain \n -at least one upper case \n -at least one lower case \n -at least one digit \n -at least one Special character \n -Must be at least 8 characters in length';
              }
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
            } else {
              return null;
            }
          } else if (isemail == true &&
              ispassword == false &&
              isPhone == false) {
            if (value!.isEmpty || !emailRegex.hasMatch(value)) {
              return 'Please enter a valid email address';
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
            } else {
              return null;
            }
          } else if (isPhone == true &&
              isemail == false &&
              ispassword == false) {
            if (value!.isEmpty || !passwordRegex.hasMatch(value)) {
              return 'Please enter a valid password';
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
            } else {
              return null;
            }
          } else {
            if (value!.isNotEmpty) {
              return null;
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
              ;
            }
          }
        },
      ),
    );
  }
}
