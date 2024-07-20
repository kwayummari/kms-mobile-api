import 'dart:convert';

import 'package:kms/src/api/apis.dart';
import 'package:flutter/material.dart';

class userService {
  Api api = Api();
  Future users(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'companyId': id.toString(),
    };
    final response = await api.post(context, 'getUserByCompanyId', data);
    final datas = jsonDecode(response.body);
    return datas;
  }
}