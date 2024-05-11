import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFunction {
  var email;
  var id;
  var role;

  Future navigatorToHome(context) async {
    await getValidationData();

    await Future.delayed(Duration(seconds: 1), () {});

      if (id.toString().isEmpty || id == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        Navigator.pushNamed(context, RouteNames.bottomNavigationBar);
      }
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var i = sharedPreferences.getString('id');
    var r = sharedPreferences.getString('role');
    id = i;
    role = r;
  }

  Future<String> getEmail() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var e = sharedPreferences.getString('email');
    return e.toString();
  }

  Future<String> getId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var i = sharedPreferences.getString('id');
    return i.toString();
  }

  Future<String> getRole() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var r = sharedPreferences.getString('role');
    return r.toString();
  }

}
