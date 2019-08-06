//https://medium.com/@nils.backe/flutter-alert-dialogs-9b0bb9b01d28

import 'package:flutter/material.dart';

class ALertDialogSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
        RaisedButton(onPressed:()
        {
          showDialog(context: context,
          builder: (BuildContext context)
          {
              return AlertDialog(title: Text("Title"),content: Text("Body"),);
          });
        },
        child: Text("Show Alert"))
      )
    );
  }
}
