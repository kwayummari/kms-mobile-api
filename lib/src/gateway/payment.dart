import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apis.dart';
import '../provider/login-provider.dart';
import '../widgets/app_snackbar.dart';

class paymentService {
  final Api api = Api();

  Future<void> payment(
      BuildContext context, String phoneNumber, String content_id, String amount) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    myProvider.updateLoging(!myProvider.myLoging);
    final prefs = await SharedPreferences.getInstance();
    var user_id = await prefs.getString('id');
    Map<String, dynamic> data = {
      'phone_number': phoneNumber,
      'user_id': user_id,
      'content_id': content_id,
      'amount': amount
    };

    final response = await api.post(context, 'payment', data);
    final newResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: false,
        response: newResponse['message'],
      ).show(context);
      AppSnackbar(
        isError: false,
        response: newResponse['message'],
      ).show(context);
    } else {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: newResponse['message'],
      ).show(context);
    }
  }
}
