import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage(String activity, {Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [Text("EHEHEHE")],
          ),
        ),
      ),
    );
  }
}
