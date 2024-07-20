import 'dart:convert';

import 'package:kms/src/api/apis.dart';
import 'package:flutter/material.dart';

class loanService {
  Api api = Api();
  Future loans(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'companyId': id.toString(),
    };
    final response = await api.post(context, 'products', data);
    final datas = jsonDecode(response.body);
    return datas;
  }
}
