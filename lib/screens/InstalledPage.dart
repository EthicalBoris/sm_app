import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/data/Game.dart';
import 'package:sm_app/data/InstalledGame.dart';

class InstalledPage extends StatefulWidget {
  @override
  _InstalledPageState createState() => _InstalledPageState();
}

class _InstalledPageState extends State<InstalledPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Game.refreshInstalledGames();
    });
  }

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
        Expanded(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: InstalledGame.installedGames.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.file(
                      InstalledGame.installedGames[index].thumbnail.file),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
