import 'package:flutter/material.dart';
import 'package:foodly_app/app/app.locator.dart';
import 'package:foodly_app/ui/common/app_colors.dart';
import 'package:foodly_app/ui/views/login/login_view.dart';
import 'package:foodly_app/ui/views/signup/signup_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
          fontFamily: 'SFProText',
        primaryColor: kcPrimaryColor,
        primarySwatch: Colors.green
      ),
      initialRoute: Routes.loginView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      // home: LoginView(),
    );
  }
}

