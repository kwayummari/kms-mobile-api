import 'dart:convert';

import 'package:kms/src/api/apis.dart';
import 'package:flutter/material.dart';

class menuService {
  Api api = Api();
  Future menu(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'id': id.toString(),
    };
    final response = await api.post(context, 'getPermission', data);
    final datas = jsonDecode(response.body);
    return datas;
  }
}
