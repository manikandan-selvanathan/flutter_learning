import 'package:flutter/material.dart';
import 'package:flutter_training/LocationServiceSample.dart';
import 'package:flutter_training/LoggerSamplePage.dart';
import 'package:flutter_training/camera/CameraSamplePage.dart';
import 'package:flutter_training/customFont/CustomFontSamplePage.dart';
import 'package:flutter_training/layouts/LayoutSample.dart';
import 'package:flutter_training/layouts/ListViewSample.dart';
import 'package:flutter_training/popups/AlertDialogSample.dart';
import 'package:flutter_training/webview/WebViewSamplePage.dart';
import 'package:camera/camera.dart';
import 'BarcodeSamplePage.dart';
import 'maps/GoogleMapsSamplePage.dart';

class DrawerItem
{
  String title;
  DrawerItem(this.title);
}

class DrawerSamplePage extends StatefulWidget {

  
  @override
  _DrawerSamplePageState createState() => _DrawerSamplePageState();
  
}


class _DrawerSamplePageState extends State<DrawerSamplePage> {
  int _selectedDrawerIndex=0;
  List<DrawerItem> listOfMenus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Training Sample Snippets")),
       drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            Expanded(flex:3,child:UserAccountsDrawerHeader(accountName: new Text("Manikandan Selvanathan"),currentAccountPicture: Image.network("https://media.licdn.com/dms/image/C4E03AQEaSdFe7v9KEg/profile-displayphoto-shrink_200_200/0?e=1570665600&v=beta&t=VnETy82dFHoL1iriXT4GJjodqDfVoZT4rOh8LNK15gs"), accountEmail: Text("manikandansaisai@gmail.com"))),
            Expanded(flex: 7,child: createListView(context))
          ],
        ),
      ),
      body: getPage(_selectedDrawerIndex),
    
    );
  }

 Widget createListView(BuildContext context) {
   listOfMenus=[
      DrawerItem("Layout"), 
      DrawerItem("Barcode"),
      DrawerItem("Custom Font"),
      DrawerItem("Location Service"),
      DrawerItem("Alert Dialog"),
      DrawerItem("WebView"),
      DrawerItem("Google Maps"),
      DrawerItem("Logger"),
      DrawerItem("Camera")];
    final listview = ListView.builder(itemBuilder: _buildRow,itemCount: listOfMenus.length);
    return listview;
  }

 Widget _buildRow(BuildContext context, int index) {
    return Card( 
      child:
          ListTile(
          title: new Text(listOfMenus[index].title),
          selected: index == _selectedDrawerIndex,
          onTap: () => _onSelectItem(index),
        )  
    );
  }

  _onSelectItem(int i)
  {
    setState(() {
        _selectedDrawerIndex=i;
         Navigator.of(context).pop();
    });  
  }

  getPage(int i)
  {
    switch(i)
    {
        case 0:
              return ListViewSample();
        break;
        case 1:
              return BarcodeSamplePage();
        break;
        case 2:
              return CustomFontSamplePage();
        break;
        case 3:
              return LocationServiceSample();
        break;
        case 4:
               return ALertDialogSamplePage();
        break;
        case 5:
               return WebViewSamplePage();
        break;
        case 6:
               return GoogleMapsSamplePage();
        break;
        case 7:
               return LoggerSamplePage();
        break;
        case 8:
          return CameraSamplePage();
        break;
         
        default:
               return WebViewSamplePage();
        break;

    }
  }
}