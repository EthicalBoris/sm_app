import 'package:flutter/material.dart';
import 'package:sm_app/data/Game.dart';
import 'package:sm_app/widgets/GameRow.dart';

class InstalledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Installed Games",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      Text("Grid of games will be below")
      ],
    );
  }
}
