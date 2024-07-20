import 'dart:convert';

import 'package:kms/src/api/apis.dart';
import 'package:flutter/material.dart';

class sharesService {
  Api api = Api();
  Future shares(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'companyId': id.toString(),
    };
    final response = await api.post(context, 'shares', data);
    final datas = jsonDecode(response.body);
    return datas;
  }
}
