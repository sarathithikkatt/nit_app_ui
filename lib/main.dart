import 'package:flutter/material.dart';
import 'package:nit_app_ui/Screens/login.dart';
import 'package:nit_app_ui/Screens/signup.dart';
import 'package:nit_app_ui/Screens/survey.dart';
import 'package:nit_app_ui/Widgets/activities.dart';

import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      // home: SignupPage(),
      home: LoginPage(),
    );
  }
}
