import 'package:banchaproj/utility/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();

    Uri uri = Uri.parse(AppConstant.urlWebView);

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {},
          onPageStarted: (url) {},
          onPageFinished: (url) {},
          onWebResourceError: (error) {},
          onNavigationRequest: (request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(uri).then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return webViewController == null
        ? const SizedBox()
        : WebViewWidget(controller: webViewController!);
  }
}
