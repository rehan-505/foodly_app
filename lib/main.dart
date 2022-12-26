import 'package:flutter/material.dart';
import 'package:foodly_app/app/app.locator.dart';
import 'package:foodly_app/ui/common/app_colors.dart';
import 'package:foodly_app/ui/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app/app.router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: (FirebaseAuth.instance.currentUser!=null) ? const HomeView() : null ,

      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      // home: LoginView(),
    );
  }
}

