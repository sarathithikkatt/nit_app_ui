// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nit_app_ui/Widgets/activities.dart';
import 'package:nit_app_ui/Widgets/sleep.dart';
// import 'package:survey_app/Screens/surveys.dart';
// import 'package:survey_app/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [ActivitiesWidget(), SleepWidget()],
      ),
    );
  }
}
