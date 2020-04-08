import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/data/Game.dart';
import 'package:sm_app/data/InstalledGame.dart';
import 'package:sm_app/screens/GamePlayPage.dart';
import 'dart:io';

import 'package:sm_app/widgets/DeleteDialog.dart';

class InstalledPage extends StatefulWidget {
  @override
  _InstalledPageState createState() => _InstalledPageState();
}

class _InstalledPageState extends State<InstalledPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }

  void refresh() async {
    List<InstalledGame> temp = await Game.refreshInstalledGames();
    setState(() {
      InstalledGame.installedGames = temp;
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
          child: InstalledGame.installedGames.length > 0
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: InstalledGame.installedGames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePlayPage(
                                        game:
                                            InstalledGame.installedGames[index],
                                      )),
                            );
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => DeleteDialog(
                                game: InstalledGame.installedGames[index],
                              ),
                            ).then((value) {
                              if (value == "delete") {
                                InstalledGame.deleteGame(index);
                                refresh();
                              }
                            });
                          },
                          child: Stack(
                            children: <Widget>[
                              Image.file(InstalledGame
                                  .installedGames[index].thumbnail.file),
                              Positioned(
                                left: 5.0,
                                bottom: 20.0,
                                right: 1,
                                child: Text(
                                  InstalledGame.installedGames[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Positioned(
                                left: 6.0,
                                bottom: 10.0,
                                right: 1,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.gamepad,
                                      size: 10.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      InstalledGame.installedGames[index].type,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("No games currently installed..."),
                ),
        ),
      ],
    );
  }
}
