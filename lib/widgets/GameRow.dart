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
        child: new Image(
          image: this.game.image,
          height: 92.0,
          width: 92.0,
        ),
      ),
    );
  }

  Widget gameCard() {
    return new Container(
      height: 124.0,
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
    );
  }
}
