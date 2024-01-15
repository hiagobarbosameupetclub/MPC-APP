

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  runApp(MaterialApp());
}

class HomeClientPage extends StatefulWidget {
  static const String routeName = '/homeclientpage';
  // final String mensagem;
  //
  // const HomeClientPage({Key? key, required this.mensagem}) : super(key: key);
  const HomeClientPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
      settings: PullToRefreshSettings(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          webViewController?.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          webViewController?.loadUrl(
              urlRequest:
              URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("MPC"),
          backgroundColor: Colors.blueAccent
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    InAppWebView(
                      key: webViewKey,
                      initialUrlRequest:
                      URLRequest(url: WebUri("https://stable-b2b.meupetclub.com.br"), headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGIwMzU3ZWJkZTQzN2Q5YzM2NTQ0NWMiLCJlbWFpbCI6ImFkbWlubWFzdGVyQGFkbWluLmNvbSIsImVudGlkYWRlc1VzdWFyaW8iOlt7InRpcG8iOiJBRE1JTklTVFJBRE9SIiwicGVyZmlsQWNlc3NvIjoiTUFTVEVSIn1dLCJleHBpcmVkQXQiOm51bGwsImlhdCI6MTcwNTA2ODU0NCwiZXhwIjoxNzA1MDk3MzQ0fQ.NTKIKQ9LmoUgzAdikBzrDyrLUHvX-iP9p3RDquVusyk"}),
                      pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onLoadStart: (controller, url) {
                        //controller.loadUrl(urlRequest: url, headers:{})
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onPermissionRequest: (controller, request) async {
                        return PermissionResponse(
                            resources: request.resources,
                            action: PermissionResponseAction.GRANT);
                      },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        var uri = navigationAction.request.url!;

                        if (![
                          "http",
                          "https",
                          "file",
                          "chrome",
                          "data",
                          "javascript",
                          "about"
                        ].contains(uri.scheme)) {
                          if (await canLaunchUrl(uri)) {
                            // Launch the App
                            await launchUrl(
                              uri,
                            );
                            // and cancel the request
                            return NavigationActionPolicy.CANCEL;
                          }
                        }

                        return NavigationActionPolicy.ALLOW;
                      },
                      onLoadStop: (controller, url) async {
                        pullToRefreshController?.endRefreshing();
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onReceivedError: (controller, request, error) {
                        pullToRefreshController?.endRefreshing();
                      },
                      onProgressChanged: (controller, progress) {
                        if (progress == 100) {
                          pullToRefreshController?.endRefreshing();
                        }
                        setState(() {
                          this.progress = progress / 100;
                          urlController.text = url;
                        });
                      },
                      onUpdateVisitedHistory: (controller, url, androidIsReload) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        if (kDebugMode) {
                          print(consoleMessage);
                        }
                      },
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Icon(Icons.arrow_back),
                    onPressed: () {
                      webViewController?.goBack();
                    },
                  ),
                  ElevatedButton(
                    child: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      webViewController?.goForward();
                    },
                  ),
                  ElevatedButton(
                    child: const Icon(Icons.refresh),
                    onPressed: () {
                      webViewController?.reload();
                    },
                  ),
                ],
              ),
            ])));
  }
}
// import 'package:flutter/material.dart';
//
// class HomeClientPage extends StatefulWidget {
//   static const String routeName = '/homeclientpage';
//   final String mensagem;
//
//   const HomeClientPage({Key? key, required this.mensagem}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() => _HomeClientPageState(mensagem);
// }
//
// class _HomeClientPageState extends State<HomeClientPage> {
//   final String mensagem;
//
//   _HomeClientPageState(this.mensagem);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Segunda Página'),
//       ),
//       body: Center(
//         child: Text(mensagem)
//       ),
//     );
//   }
// }