import 'package:kms/src/screens/introduction/intro.dart';
import 'package:kms/src/screens/models/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:kms/src/screens/models/contents/contents_by_category.dart';
import 'package:kms/src/screens/models/contents/contents_by_id.dart';
import 'package:kms/src/screens/models/dashboard/dashboard.dart';
import 'package:kms/src/screens/models/payment/payment.dart';
import 'package:kms/src/screens/models/profile/profile.dart';
import 'package:kms/src/utils/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:kms/src/screens/authentication/login.dart';
import 'package:kms/src/screens/authentication/registration.dart';
import 'package:kms/src/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.intro: (context) => IntroScreen(),
  RouteNames.dashboard: (context) => dashboard(),
  RouteNames.profile: (context) => profile(),
  RouteNames.bottomNavigationBar: (context) => bottomNavigation(),
  RouteNames.getContentsByCategory: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return contentsByCategoryId(
      id: args?['content_id'],
      title: args?['title'],
    );
  },
  RouteNames.getContentsById: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return contentsById(
      name: args?['name'],
      styleId: args?['styleId'],
    );
  },
  RouteNames.payment: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Payment(
      id: args?['content_id'],
      title: args?['title'],
      amount: args?['amount'],
    );
  },
};
