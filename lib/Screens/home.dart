// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nit_app_ui/Screens/signup.dart';
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
  void initState() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SignupPage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ActivitiesWidget(),
              SleepWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
