import 'dart:convert';

import 'package:gugu/src/api/apis.dart';
import 'package:flutter/material.dart';

class profileService {
  Api api = Api();
  Future profile(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'id': id.toString(),
    };
    final response = await api.post(context, 'getUserById', data);
    final datas = jsonDecode(response.body);
    return datas;
  }
}
