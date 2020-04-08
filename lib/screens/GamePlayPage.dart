import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http_server/http_server.dart';
import 'package:sm_app/data/InstalledGame.dart';

class GamePlayPage extends StatefulWidget {
  final InstalledGame game;

  GamePlayPage({this.game});

  @override
  _GamePlayPageState createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  bool serverStarted = false;

  ValueNotifier closeServer = ValueNotifier(false);

  InternetAddress host = InternetAddress.loopbackIPv4;
  static const PORT = 8080;

  static VirtualDirectory staticFiles = new VirtualDirectory('.');

  @override
  void initState() {
    super.initState();

    staticFiles = new VirtualDirectory(widget.game.installDir.path)
      ..allowDirectoryListing = true;

    runZoned(startServer, onError: (e) {
      print("Error: " + e);
    });
  }

  startServer() async {
    await HttpServer.bind(host, PORT).then((server) {
      server.listen(staticFiles.serveRequest);

      closeServer.addListener(() {
        setState(() {
          serverStarted = false;
        });
        server.close();
        print("Closed server");

        Navigator.pop(context);
      });

      setState(() {
        serverStarted = true;
      });

      return server;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://127.0.0.1:8080/index.html",
      clearCache: true,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              closeServer.value = true;
            },
          ),
          title: Text(widget.game.name)),
    );
  }
}
