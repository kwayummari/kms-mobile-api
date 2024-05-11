import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gugu/src/provider/login-provider.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:gugu/src/widgets/socialMedia.dart';
import 'package:flutter/material.dart';
import 'package:gugu/src/gateway/registration-services.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_button.dart';
import 'package:gugu/src/widgets/app_input_text.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool dont_show_password = true;
  bool obscure = true;
  bool obscure1 = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return AppBaseScreen(
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppConst.black,
            )),
        backgroundColor: AppConst.white,
        centerTitle: true,
        title: AppText(
          weight: FontWeight.w700,
          txt: 'Registration',
          size: 20,
          color: AppConst.black,
        ),
      ),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppText(
                txt:
                    'Welcome to our community of K-Structure, where you can join our growing network of like-minded individuals, discover new and exciting features,and create your own content and resource that will help you get the most out of our app.',
                size: 15,
                color: AppConst.black,
                weight: FontWeight.w900,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  AppInputText(
                    textsColor: AppConst.black,
                    isemail: false,
                    textfieldcontroller: fullname,
                    ispassword: false,
                    fillcolor: AppConst.white,
                    label: 'Fullname',
                    obscure: false,
                    icon: Icon(
                      Icons.person,
                      color: AppConst.black,
                    ),
                  ),
                  AppInputText(
                    textsColor: AppConst.black,
                    isemail: false,
                    isPhone: true,
                    textfieldcontroller: phone,
                    ispassword: false,
                    fillcolor: AppConst.white,
                    label: 'Phone number',
                    obscure: false,
                    icon: Icon(
                      Icons.phone,
                      color: AppConst.black,
                    ),
                  ),
                  AppInputText(
                    textsColor: AppConst.black,
                    isemail: false,
                    suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: obscure == true
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility)),
                    textfieldcontroller: password,
                    ispassword: true,
                    fillcolor: AppConst.white,
                    label: 'Password',
                    obscure: obscure,
                    icon: Icon(
                      Icons.lock,
                      color: AppConst.black,
                    ),
                  ),
                  AppInputText(
                    textsColor: AppConst.black,
                    isemail: false,
                    suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure1 = !obscure1;
                          });
                        },
                        icon: obscure1 == true
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility)),
                    textfieldcontroller: rpassword,
                    ispassword: false,
                    fillcolor: AppConst.white,
                    label: 'Password',
                    obscure: obscure1,
                    icon: Icon(
                      Icons.lock,
                      color: AppConst.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  myProvider.myLoging == true
                      ? SpinKitCircle(
                          color: AppConst.primary,
                        )
                      : Container(
                          width: 350,
                          height: 49,
                          child: AppButton(
                            onPress: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              registrationService().registration(
                                  context,
                                  password.text,
                                  rpassword.text,
                                  fullname.text,
                                  phone.text);
                            },
                            label: 'SIGN UP',
                            borderRadius: 5,
                            textColor: AppConst.white,
                            bcolor: AppConst.primary,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: AppText(
                              txt: 'By continuing you accept ',
                              size: 15,
                              color: AppConst.primary,
                            )),
                        AppText(
                          txt: 'terms and conditions and our privacy policy',
                          size: 15,
                          color: AppConst.primary,
                        )
                      ],
                    ),
                  ),
                  socialMedia(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RouteNames.login),
                    child: Row(
                      children: [
                        Spacer(),
                        AppText(
                          txt: 'Already have an account?',
                          size: 15,
                          color: AppConst.primary,
                          weight: FontWeight.w400,
                        ),
                        AppText(
                          txt: 'Sign In',
                          size: 15,
                          color: AppConst.primary,
                          weight: FontWeight.bold,
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
