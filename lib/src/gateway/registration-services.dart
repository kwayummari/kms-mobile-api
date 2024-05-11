import 'dart:convert';

import 'package:gugu/src/api/apis.dart';
import 'package:gugu/src/provider/login-provider.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:gugu/src/widgets/app_snackbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> registration(BuildContext context, String password,
      String rpassword, String fullname, String phone) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    myProvider.updateLoging(!myProvider.myLoging);
    if (password.toString() == rpassword.toString()) {
      Map<String, dynamic> data = {
        'full_name': fullname.toString(),
        'phone_number': phone.toString(),
        'password': password.toString(),
      };
      final response = await api.post(context, 'register_user', data);
      final newResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        myProvider.updateLoging(!myProvider.myLoging);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', newResponse['userId'].toString());
        Fluttertoast.showToast(
          msg: newResponse['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConst.primary,
          textColor: Colors.white,
          fontSize: 15.0,
        );
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        myProvider.updateLoging(!myProvider.myLoging);
        AppSnackbar(
          isError: true,
          response: newResponse['message'],
        ).show(context);
      }
    } else {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: 'Passwords do not match!',
      ).show(context);
    }
  }
}
