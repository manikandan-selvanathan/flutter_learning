import 'package:flutter/material.dart';

class AnimatedContainerSamplePage extends StatefulWidget {
  @override
  _AnimatedContainerSamplePageState createState() => _AnimatedContainerSamplePageState();
   
}

class _AnimatedContainerSamplePageState extends State<AnimatedContainerSamplePage> {
  var height=50.0;
  var bgColor=Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ 
              AnimatedContainer(
              height: height,
              color: bgColor,
              curve: Curves.bounceInOut,
              duration:Duration(seconds: 3)
            ),
            RaisedButton(child: Text("Animate the Container"),
            onPressed: (){
              setState(() {
                height=100.0;
                bgColor=Colors.deepPurple;
              });
          },),
      ],
    );
  }
}