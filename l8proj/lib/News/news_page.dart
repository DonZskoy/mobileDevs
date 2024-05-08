import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});



  @override
  State<NewsPage> createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  String _url = ' ';

  @override
  void didChangeDependencies() {
    final urlArg = ModalRoute.of(context)?.settings.arguments;
    if (urlArg == null) {
      return;
    }
    if (urlArg is! String) {
      return;
    }
    _url = urlArg;
    setState(() {});
    super.didChangeDependencies();
  }

  late final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(_url)) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(_url));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Новости')
      ),
      body: WebViewWidget(controller: controller),
    );
  }


}