//https://medium.com/flutter-community/a-guide-to-setting-up-better-logging-in-flutter-3db8bab2000e
//⛔ - Error
//💡 - Info

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoggerSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logger = Logger();

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            onPressed: () {
              try {
                logger.i("Button Clicked");
                throw new Exception("Sample Exception");
              } catch (e) {
                logger.e(e.toString());
              }
            },
            child: Text("Log Message")),
        Text("See the logs in Debug Console - Visual studio code")
      ],
    )));
  }
}
