import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/apis.dart';
import '../provider/login-provider.dart';
import '../utils/routes/route-names.dart';
import '../widgets/app_snackbar.dart';

class loginService {
  final Api api = Api();

  Future<void> login(
      BuildContext context, String email, String password) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    myProvider.updateLoging(!myProvider.myLoging);
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    final response = await api.post(context, 'login', data);
    final newResponse = jsonDecode(response.body);
    print(newResponse);

    if (response.statusCode == 200) {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: false,
        response: newResponse['message'],
      ).show(context);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString(
          'fullname', newResponse['user']['fullname'].toString());
      await prefs.setString('id', newResponse['user']['id'].toString());
      await prefs.setString('role', newResponse['user']['role'].toString());
      await prefs.setString(
          'rolesName', newResponse['user']['name'].toString());
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.bottomNavigationBar,
        (_) => false,
      );
    } else {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: newResponse['message'],
      ).show(context);
    }
  }
}
