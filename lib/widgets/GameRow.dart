import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/data/Game.dart';

class GameRow extends StatelessWidget {
  final Game game;

  GameRow(this.game);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      child: new Stack(
        children: <Widget>[
          gameCard(),
          gameThumbnail(),
        ],
      ),
    );
  }

  Widget gameThumbnail() {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Hero(
          tag: game.imageUrl,
          child: CachedNetworkImage(
            imageUrl: game.imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 92.0,
            width: 92.0,
          ),
        ),
      ),
    );
  }

  Widget gameCard() {
    return new Container(
      height: 125.0,
      width: 400.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                top: 15.0,
                child: Row(
                  children: <Widget>[
                    Text(game.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      width: 100.0,
                    ),
                    Icon(
                      Icons.gamepad,
                      size: 15.0,
                    ),
                    Text(game.type,
                        style: TextStyle(
                          fontSize: 10.0,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Container(child: Text(game.description)),
              ),
            ],
          )),
    );
  }
}
