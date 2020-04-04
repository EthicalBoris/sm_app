import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    //_loadHtmlFromAssets();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.game.name)),
      body: WebView(
        initialUrl: "${widget.game.downloadUrl}/index.html",
        /*
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },*/
      ),
    );
  }

  _loadHtmlFromAssets() async {
    File indexFile = File("${widget.game.downloadUrl}/index.html");

    List<String> fileText = await indexFile.readAsLinesSync();

    String testText = "";

    for (int i = 0; i < fileText.length; i++) {
      testText += "${fileText[i]} ";
    }

    _controller.loadUrl(Uri.dataFromString(testText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
