import 'dart:convert';

import 'package:gugu/src/api/apis.dart';
import 'package:flutter/material.dart';

class hairDressers {
  Api api = Api();
  Map<String, dynamic> data = {
    'companyId': '1',
  };
  Future getHairDresser(BuildContext context) async {
    final response = await api.post(context, 'getHairDresser', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  Future getStyles(BuildContext context) async {
    final response = await api.post(context, 'getAllHairStyle', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  Future getHairDresserById(BuildContext context, String id) async {
    Map<String, dynamic> dataValue = {
      'styleId': id,
    };
    final response = await api.post(context, 'getHairDresserById', dataValue);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  Future getProducts(BuildContext context) async {
    Map<String, dynamic> dataValue = {
      'companyId': '1',
    };
    final response = await api.post(context, 'products', dataValue);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  Future makeOrder(
      BuildContext context,
      String name,
      String phone,
      String hairStyleId,
      String inventoryId,
      String number,
      String hairDresserId) async {
    Map<String, dynamic> dataValue = {
      'name': name,
      'phone': phone,
      'hairStyleId': hairStyleId,
      'inventoryId': inventoryId,
      'number': number,
      'hairDresserId': hairDresserId
    };
    final response = await api.post(context, 'addOrder', dataValue);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }
}
