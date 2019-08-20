import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferenceSamplePage extends StatefulWidget {
  @override
  _SharedPreferenceSamplepageState createState() => _SharedPreferenceSamplepageState();
}

class _SharedPreferenceSamplepageState extends State<SharedPreferenceSamplePage> {
  var saveKey='SaveKey';
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term'
            ),
            controller: myController),
          MaterialButton(child: Text("Save"),color: Colors.green,onPressed: ()async{
            if(!myController.text.isEmpty)
            {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString(saveKey, myController.text);
              myController.clear();
              showAlert('Text saved in shared preference');
            }
            else
            {
              showAlert('Enter some value');
            }
          }),
          MaterialButton(child: Text("Retrive"),color: Colors.red,onPressed: ()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              Logger logger=new Logger();
              var returnedValue=prefs.getString(saveKey);
              logger.i(returnedValue);
              showAlert('Saved Text: $returnedValue');
          })
        ],
      ),
    );
  }

  void showAlert(String message)
  {
     final snackBar = SnackBar(content: Text(message),duration:Duration(seconds: 1));
     Scaffold.of(context).showSnackBar(snackBar);
  }
}