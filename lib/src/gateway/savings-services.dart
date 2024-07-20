import 'dart:convert';

import 'package:kms/src/api/apis.dart';
import 'package:flutter/material.dart';

class savingsService {
  Api api = Api();
  Future savings(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'companyId': id.toString(),
    };
    final response = await api.post(context, 'getSavings', data);
    final datas = jsonDecode(response.body);
    return datas;
  }
}
