//https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2
//webview_flutter: ^0.3.10+4
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSamplePage extends StatefulWidget {
  @override
  _WebViewSamplePageState createState() => _WebViewSamplePageState();
}

class _WebViewSamplePageState extends State<WebViewSamplePage> {
  WebViewController _controller;
  ProgressDialog pr;
  Logger logger = Logger();

  @override
  void initState() {
    pr = new ProgressDialog(context, ProgressDialogType.Normal);
    pr.setMessage("Loading");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            flex: 9,
            child: WebView(
              initialUrl: 'http://google.in',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
                pr.show();
              },
              onPageFinished: (url) {
                pr.hide();
                logger.i("Page Loaded: " + url);
                _controller.evaluateJavascript("console.log('Hello')");
              },
              navigationDelegate: (action) {
                logger.i(action.url);
                if (action.url ==
                    "https://stackoverflow.com/users/login?ssrc=head&returnurl=https%3a%2f%2fstackoverflow.com%2f") {
                  return NavigationDecision.prevent;
                } else {
                  pr.show();
                  return NavigationDecision.navigate;
                }
              },
              debuggingEnabled: true,
            )),
        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Text("Open StackOverFlowPage"),
            onPressed: () {
              pr.show();
              _controller.loadUrl("https://stackoverflow.com/");
            },
          ),
        )
      ],
    ));
  }
}
