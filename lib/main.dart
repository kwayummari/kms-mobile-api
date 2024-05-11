// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gugu/src/functions/createMaterialColor.dart';
import 'package:gugu/src/provider/login-provider.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:gugu/src/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        initialRoute: RouteNames.splash,
        routes: routes,
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: 'GUGU BEAUTY SALOON',
        theme: ThemeData(
            // timePickerTheme: Theme.of(context).primaryColor,
            cardColor: AppConst.primary,
            highlightColor: AppConst.primary,
            splashColor: AppConst.primary,
            primaryColor: AppConst.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: createMaterialColor(AppConst.primary),
            ).copyWith(background: AppConst.primary)),
      ));
}
