// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gugu/src/gateway/payment.dart';
import 'package:gugu/src/provider/login-provider.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_button.dart';
import 'package:gugu/src/widgets/app_input_text.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  var id;
  var title;
  var amount;

  Payment(
      {Key? key, required this.id, required this.title, required this.amount})
      : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController phone_number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return AppBaseScreen(
        appBar: AppBar(
          title: AppText(
            txt: widget.title,
            size: 20,
            weight: FontWeight.w800,
          ),
          centerTitle: true,
        ),
        bgcolor: AppConst.white,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: AppConst.black,
              ),
              SizedBox(
                height: 20,
              ),
              AppText(
                txt:
                    'You will be enrolled to this course after you successfully complete payment',
                size: 23,
                color: AppConst.black,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 20,
              ),
              AppText(
                txt: 'Choose Payment',
                size: 23,
                color: AppConst.black,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/mobiles.png'),
              SizedBox(
                height: 20,
              ),
              AppInputText(
                textsColor: AppConst.black,
                textfieldcontroller: phone_number,
                ispassword: false,
                fillcolor: AppConst.white,
                label: 'Enter Phone Number',
                obscure: false,
                icon: Icon(
                  Icons.phone_android,
                  color: AppConst.black,
                ),
                isemail: false,
                isPhone: true,
              ),
              myProvider.myLoging == true
                  ? SpinKitCircle(
                      color: AppConst.primary,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: AppButton(
                          onPress: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            paymentService().payment(context, phone_number.text,
                                widget.id, widget.amount);
                          },
                          label: 'LOGIN',
                          borderRadius: 5,
                          textColor: AppConst.white,
                          bcolor: AppConst.primary,
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
