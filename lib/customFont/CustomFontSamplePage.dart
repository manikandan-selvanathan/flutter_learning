import 'package:flutter/material.dart';

class CustomFontSamplePage extends StatefulWidget {
  @override
  _CustomFontSamplePageState createState() => _CustomFontSamplePageState();
}

class _CustomFontSamplePageState extends State<CustomFontSamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Normal Font Text",style: TextStyle(
            fontSize: 20
          )),
          Text("Custom Font Text", style: TextStyle(
            fontFamily: "CustomFont",
            fontSize: 20
          ),)
        ],
      ),
    ));
  }
}
    