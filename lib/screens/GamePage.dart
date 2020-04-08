import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sm_app/data/Game.dart';
import 'dart:io';

class GamePage extends StatefulWidget {
  final Game game;

  GamePage({this.game});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double downloadPercent = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget downloadButton() {
    if (widget.game.isInstalled) {
      return MaterialButton(
        minWidth: 100.0,
        height: 35,
        color: Colors.grey,
        child: Text('Installed',
            style: TextStyle(fontSize: 16.0, color: Colors.white)),
        onPressed: () {},
      );
    } else {
      return MaterialButton(
        minWidth: 100.0,
        height: 35,
        color: Colors.green,
        child: Text('Download',
            style: TextStyle(fontSize: 16.0, color: Colors.white)),
        onPressed: () async {
          // Install the game zip and unzip at a target location.
          setState(() {
            widget.game.isDownloading = true;
          });
          await widget.game.downloadGame().then((value) {
            try {
              setState(() {
                widget.game.isDownloading = false;
              });
            } catch (e) {}
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(30, 30),
                    bottomRight: Radius.elliptical(30, 30),
                  ),
                  child: Hero(
                    tag: widget.game.imageUrl,
                    child: CachedNetworkImage(
                      imageUrl: widget.game.imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.longArrowAltLeft),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.game.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.gamepad,
                          size: 20.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          widget.game.type,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: widget.game.isDownloading
                      ? CircularProgressIndicator()
                      : downloadButton()),
            ],
          ),
          Text(
            widget.game.description,
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
