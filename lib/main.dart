import 'package:flutter/material.dart';
import 'drawer/DrawerSamplePage.dart'; 

Future<void> main() async {
  // Obtain a list of the available cameras on the device.


  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training - Manikandan Selvanathan',
      home: DrawerSamplePage()
    ),
  );
}

