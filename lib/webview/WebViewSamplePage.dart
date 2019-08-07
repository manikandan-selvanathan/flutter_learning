//https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2
//webview_flutter: ^0.3.10+4
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSamplePage extends StatefulWidget {
  @override
  _WebViewSamplePageState createState() => _WebViewSamplePageState();
}


class _WebViewSamplePageState extends State<WebViewSamplePage> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("WebView Sample")),
        body:
        Stack(
         children: <Widget>[
           WebView
             (
               initialUrl: 'http://google.in',
               javascriptMode: JavascriptMode.unrestricted,
               onWebViewCreated: (WebViewController webViewController) {
                 _controller = webViewController;
               },
           ),
           RaisedButton(
             child: Text("Open New Page"),
             onPressed:(){ _controller.loadUrl("https://stackoverflow.com/");},
           )
         ],
        )

    );
  }
}
