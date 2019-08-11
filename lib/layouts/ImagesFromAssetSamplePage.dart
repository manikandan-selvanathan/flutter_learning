import 'dart:math';

import 'package:flutter/material.dart';

class ImagesFromSamplePage extends StatefulWidget {
  @override
  _ImagesFromSamplePageState createState() => _ImagesFromSamplePageState();
}

class _ImagesFromSamplePageState extends State<ImagesFromSamplePage> {
  String _imageSource = "assets/images/1.jpg";
  var lastImageSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Image.network("https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",height: 100,width: 100);
    //Image.asset("assets/images/1.jpg");
    //FadeInImage.assetNetwork(placeholder: "assets/images/loading_placeholder.png", image: "https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")

    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Container(height: 200, width: 200, child: Image.asset(_imageSource)),
          RaisedButton(
              child: Text("Change Image"),
              onPressed: () {
                var rand = 1;
                var rng = new Random();
                while (true) {
                  var minmax = 6 + 1 - 1;
                  rand = rng.nextInt(minmax) + 1;
                  if (lastImageSource != rand) {
                    lastImageSource = rand;
                    break;
                  }
                }
                setState(() {
                  _imageSource = "assets/images/" + rand.toString() + ".jpg";
                });
              }),
          FadeInImage.assetNetwork(
              height: 250,
              width: 250,
              placeholder: "assets/images/loading_placeholder.png",
              image:
                  "https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
        ],
      ),
    ));
  }
}
