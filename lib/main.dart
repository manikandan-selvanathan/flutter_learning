import 'package:flutter/material.dart';
import 'DrawerSamplePage.dart';

Future<void> main() async {
  // Obtain a list of the available cameras on the device.

  runApp(
    MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Training - Manikandan Selvanathan',
        home: DrawerSamplePage()),
  );
}
