import 'package:flutter/material.dart';
import 'package:sm_app/data/Game.dart';
import 'package:sm_app/widgets/GameRow.dart';

class BrowsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Shop",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 160,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: games.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  // TODO: Implement starting a game
                },
                child: GameRow(),
              );
            },
          ),
        ),
      ],
    );
  }
}
