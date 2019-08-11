import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:logger/logger.dart';

class TensorFlowSampleModelPage extends StatefulWidget {
  @override
  _TensorFlowSampleModelPageState createState() =>
      _TensorFlowSampleModelPageState();
}

class _TensorFlowSampleModelPageState extends State<TensorFlowSampleModelPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(child: Text("Load Tensorflow"), onPressed: loadAsset),
    );
  }

  void loadAsset() async {
    var logger = Logger();
    try {
      String res = await Tflite.loadModel(
          model: "assets/tensorflowmodels/model.tflite", numThreads: 1);
      logger.d(res);
    } catch (e) {
      logger.e(e);
    }
  }
}
