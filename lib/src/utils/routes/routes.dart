import 'package:kms/src/screens/models/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:kms/src/screens/models/dashboard/dashboard.dart';
import 'package:kms/src/screens/models/loan/allLoans.dart';
import 'package:kms/src/screens/models/loan/loanApplication.dart';
import 'package:kms/src/screens/models/profile/profile.dart';
import 'package:kms/src/screens/models/savings/allSavings.dart';
import 'package:kms/src/screens/models/shares/allShares.dart';
import 'package:kms/src/screens/models/userList/user.dart';
import 'package:kms/src/utils/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:kms/src/screens/authentication/login.dart';
import 'package:kms/src/screens/authentication/registration.dart';
import 'package:kms/src/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.dashboard: (context) => Dashboard(),
  RouteNames.profile: (context) => profile(),
  RouteNames.bottomNavigationBar: (context) => bottomNavigation(),
  RouteNames.loanApplication: (context) => LoanApplication(),
  RouteNames.user: (context) => UserList(),
  RouteNames.loan: (context) => AllLoans(),
  RouteNames.savings: (context) => AllSavings(),
  RouteNames.shares: (context) => AllShares(),
};
