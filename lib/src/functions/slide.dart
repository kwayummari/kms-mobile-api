import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlideFunction {
  Future<void> login(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('intro', 'done');
    Navigator.pushNamed(context, RouteNames.login);
  }
}
