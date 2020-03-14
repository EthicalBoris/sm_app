import 'dart:ffi';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sm_app/data/Game.dart';
import 'package:sm_app/widgets/GameRow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Game> installedGames = games; // TODO: Replace games with real games list

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.red],
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SafeArea(
          child: Column(
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
              Container(
                height: MediaQuery.of(context).size.height - 139,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: installedGames.length,
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
          ),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.open_in_browser, title: "Installed"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: FontAwesomeIcons.cartPlus, title: "Browse")
          ],
          onTabChangedListener: (position) {
            setState(() {
              // currentPage = position;
            });
          },
        ),
      ),
    );
  }
}
