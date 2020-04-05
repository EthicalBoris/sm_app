import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_server/http_server.dart';
import 'package:sm_app/data/InstalledGame.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GamePlayPage extends StatefulWidget {
  final InstalledGame game;

  GamePlayPage({this.game});

  @override
  _GamePlayPageState createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  ValueNotifier closeServer = ValueNotifier(false);

  InternetAddress HOST = InternetAddress.loopbackIPv4;
  static const PORT = 8080;

  VirtualDirectory staticFiles = new VirtualDirectory('.');

  HttpServer server;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    staticFiles = new VirtualDirectory(widget.game.installDir.path)
      ..allowDirectoryListing = true;

    runZoned(startServer, onError: (e) {
      print("Error: " + e);
    });
  }

  startServer() async {
    await HttpServer.bind(HOST, PORT).then((server) {
      server.listen(staticFiles.serveRequest);
      closeServer.addListener(() {
        server.close();
        print("Closed server");
      });

      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadHtmlFromAssets();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              closeServer.value = true;
              Navigator.pop(context);
            },
          ),
          title: Text(widget.game.name)),
      body: Text('Test'),
      /*WebView(
        initialUrl: 'www.google.com',//HOST.address + "/index.html",
        javascriptMode: JavascriptMode.unrestricted,
        /*
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },*/
      ),*/
    );
  }

  _loadHtmlFromAssets() async {
    /*
    File indexFile = File("${widget.game.downloadUrl}/index.html");

    List<String> fileText = await indexFile.readAsLinesSync();

    String content = '''''';

    for (int i = 0; i < fileText.length; i++) {
      content += '''${fileText[i]}
      ''';
    }

    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(content));
    await _controller.loadUrl('data:text/html;base64,$contentBase64');
  */
  }
}
