import 'package:flutter/material.dart';
import 'DrawerSamplePage.dart';
import 'PageRedirection.dart';
import 'helper/FlutterTrainingHelper.dart';

void main() async {
  Widget page = new DrawerSamplePage();
  FlutterTrainingHelper flutterLearningHelper = new FlutterTrainingHelper();
  if (!await flutterLearningHelper.isNetworkConnected()) {
    page = new LoginPage();
  }
  runApp(
    MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Training - Manikandan Selvanathan',
        home: page),
  );
}
