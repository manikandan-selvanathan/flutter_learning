//https://flutter.dev/docs/cookbook/networking/fetch-data

import 'package:flutter/material.dart';
import 'package:flutter_training/helper/FlutterTrainingHelper.dart';
import 'package:progress_dialog/progress_dialog.dart';

class NetworkCallsSamplePage extends StatefulWidget {
  @override
  _NetworkCallsSamplePageState createState() => _NetworkCallsSamplePageState();
}

class _NetworkCallsSamplePageState extends State<NetworkCallsSamplePage> {
  ProgressDialog pr;

  @override
  void initState() {
    pr = new ProgressDialog(context, ProgressDialogType.Normal);
    pr.setMessage("Loading");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
            height: 50,
            minWidth: 200,
            color: Colors.red,
            clipBehavior: Clip.antiAlias,
            textColor: Colors.white,
            child: Text("Get API Call"),
            onPressed: () async {
              try {
                pr.show();
                var helper = new FlutterTrainingHelper();
                var response = await helper.getSayHello() ?? "Error";
                pr.hide();
                showAlert(body: response);
              } catch (e) {
                pr.hide();
              }
            }),
        SizedBox(height: 50),
        MaterialButton(
            height: 50,
            minWidth: 200,
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            textColor: Colors.white,
            child: Text("Get JSON Call"),
            onPressed: () async {
              try {
                pr.show();
                var helper = new FlutterTrainingHelper();
                var response = await helper.getJson() ?? "Error";
                pr.hide();
                showAlert(body: response);
              } catch (e) {
                pr.hide();
              }
            })
      ],
    ));
  }

  void showAlert({title, body}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text("API Response"), content: Text(body));
        });
  }
}
