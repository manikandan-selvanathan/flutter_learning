import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class BarcodeSamplePage extends StatefulWidget {
  @override
  BarcodeMainPageState createState() => BarcodeMainPageState();
}

class BarcodeMainPageState extends State<BarcodeSamplePage> {
  String result="Please scan something";

  Future scanQR() async {
  try{
      String qrResult=await BarcodeScanner.scan();
      setState(() {
        result=qrResult;
      });
  }
  catch(e)
  {

  }


  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                  tabs: <Widget>[
                    Tab(child:Icon(Icons.camera)),
                    Tab(child:Icon(Icons.list))
                  ]),
            ),
            body: TabBarView(children: <Widget>[
              Center(child:Text(result)),
              Center(child: Text('2'),)
            ]),
            floatingActionButton: FloatingActionButton.extended(
              icon:Icon(Icons.camera),
              label: Text('Scan'),
              onPressed: scanQR,
            ),
          ));
  }
}
