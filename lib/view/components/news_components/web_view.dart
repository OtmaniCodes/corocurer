import 'dart:async';
import 'dart:io';
import 'package:corocurer/config/theme_colors.dart';
import 'package:corocurer/models/post.dart';
import 'package:corocurer/view/components/shared_components/loading_ring.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebView extends StatefulWidget {
  final Post post;
  ShowWebView({this.post});

  @override
  _ShowWebViewState createState() => _ShowWebViewState();
}

class _ShowWebViewState extends State<ShowWebView> {
  bool isLoading = true;
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState(){
    super.initState();
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThmColors.lightBlueClr,
      appBar: AppBar(
        title: Text(this.widget.post.title),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: this.widget.post.webUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish){
              setState(() {
              isLoading = false;
                        });
            },
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        isLoading ? Center(child: LoadingRing()) : Stack()
        ],
      ),
    );
  }
}