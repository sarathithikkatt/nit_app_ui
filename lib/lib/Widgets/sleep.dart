import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';

class SleepWidget extends StatefulWidget {
  const SleepWidget({Key? key}) : super(key: key);

  @override
  _SleepWidgetState createState() => _SleepWidgetState();
}

class _SleepWidgetState extends State<SleepWidget> {
  TimeOfDay from = TimeOfDay.now().replacing(minute: 00);
  TimeOfDay to = TimeOfDay.now().replacing(minute: 30);
  var ab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Image.asset("assets/vector/sloth.png"),
            // Main Text
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                  child: Column(
                children: [
                  const Text(
                    "Hello how was your sleep?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2,
                        wordSpacing: 5,
                        fontSize: 20),
                  ),
                  // Second Text
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Tell us how your sleep has been",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  // Time Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(from.toString().substring(10, 15)),
                        onPressed: () {
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: from,
                              onChange: (value) => {
                                setState(() {
                                  from = value;
                                })
                              },
                              minuteInterval: MinuteInterval.FIVE,
                              disableHour: false,
                              disableMinute: false,
                              minMinute: 7,
                              maxMinute: 56,
                              // Optional onChange to receive value as DateTime
                              onChangeDateTime: (DateTime dateTime) {
                                print(dateTime);
                              },
                            ),
                          );
                        },
                      ),
                      const Text(
                        "-",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        child: Text(to.toString().substring(10, 15)),
                        onPressed: () {
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: to,
                              onChange: (value) => {
                                setState(() {
                                  to = value;
                                })
                              },
                              minuteInterval: MinuteInterval.FIVE,
                              disableHour: false,
                              disableMinute: false,
                              minMinute: 7,
                              maxMinute: 56,
                              // Optional onChange to receive value as DateTime
                              onChangeDateTime: (DateTime dateTime) {
                                print(dateTime);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Sleep Time
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text("You have Slept for $ab"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Submit"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                  )
                ],
              )),
            ),

            // ##################################################################
            // Container(
            //     child: Row(
            //   children: [
            //     Flexible(
            //       flex: 2,
            //       child: createInlinePicker(
            //         elevation: 1,
            //         value: _from,
            //         onChange: (value) => {
            //           setState(() {
            //             _from = value;
            //           })
            //         },
            //         minuteInterval: MinuteInterval.FIVE,
            //         iosStylePicker: true,
            //         minMinute: 7,
            //         maxMinute: 56,
            //       ),
            //     ),
            //     Flexible(
            //       flex: 2,
            //       child: createInlinePicker(
            //         elevation: 1,
            //         value: _to,
            //         onChange: (value) => {
            //           setState(() {
            //             _to = value;
            //           })
            //         },
            //         minuteInterval: MinuteInterval.FIVE,
            //         iosStylePicker: true,
            //         minMinute: 7,
            //         maxMinute: 56,
            //       ),
            //     ),
            //   ],
            // )),
            // ####################################################################
          ],
        ));
  }
}
