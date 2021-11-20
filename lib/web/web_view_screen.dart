// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String? webLink;
  const WebViewScreen({Key? key, this.webLink}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.webLink,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
