import 'package:flutter/material.dart';

import 'layouts/ImagesFromAssetSamplePage.dart';

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
      home: ImagesFromSamplePage(),
    );
  }
}
