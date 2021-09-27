import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nit_app_ui/Screens/survey.dart';

class ActivitiesWidget extends StatefulWidget {
  const ActivitiesWidget({Key? key}) : super(key: key);

  @override
  _ActivitiesWidgetState createState() => _ActivitiesWidgetState();
}

class _ActivitiesWidgetState extends State<ActivitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / 0.5),
          children: [
            Item(url: "sitting.png", activity: "Sitting"),
            Item(url: "standing.png", activity: "Standing"),
            Item(url: "walking.png", activity: "Walking"),
            Item(url: "jogging.png", activity: "Jogging"),
            Item(url: "downstairs.png", activity: "Downstairs"),
            Item(url: "upstair.png", activity: "Upstairs"),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({required this.url, required this.activity});
  final String url;
  final String activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        // elevation: 1,
        color: Color.fromRGBO(210, 249, 251, 0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/vector/" + url), Text(activity)],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SurveyPage(activity)));
      },
    );
  }
}
