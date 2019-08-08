import 'package:flutter/material.dart';
import 'package:flutter_training/webview/WebViewSamplePage.dart';
import 'package:flutter_training/machinelearning/TensorFlowSampleModelPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training - Manikandan Selvanathan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TensorFlowSampleModelPage(),
    );
  }
}
