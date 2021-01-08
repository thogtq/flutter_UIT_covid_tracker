import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidNews extends StatefulWidget {
  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
  String urlCovidNews = "https://ncov.moh.gov.vn/vi/web/guest/tin-tuc/";
  WebViewController _myController;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          _myController = await _controller.future;
          bool canNavigate = await _myController.canGoBack();
          if (canNavigate) {
            _myController.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: WebView(
          initialUrl: urlCovidNews,
          javascriptMode: JavascriptMode.unrestricted,
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
