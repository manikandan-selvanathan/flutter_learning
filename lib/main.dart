import 'package:flutter/material.dart';

import 'BarcodeScan.dart';
import 'package:flutter_training/layouts/LayoutSample.dart';
import 'PageRedirection.dart';
import 'layouts/ExpandedLayout.dart';
import 'layouts/ListViewSample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training - Manikandan Selvanathan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewSample(),
    );
  }
}
