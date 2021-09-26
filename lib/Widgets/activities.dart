import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivitiesWidget extends StatefulWidget {
  const ActivitiesWidget({Key? key}) : super(key: key);

  @override
  _ActivitiesWidgetState createState() => _ActivitiesWidgetState();
}

class _ActivitiesWidgetState extends State<ActivitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // constraints:
        //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              child: Card(
                color: Colors.green,
                child: Column(
                  children: [Text("Hi")],
                ),
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: Card(
                color: Colors.yellow,
                child: Column(
                  children: [Text("Hi")],
                ),
              ),
              onTap: () {},
            ),
          ],
        ));
  }
}
