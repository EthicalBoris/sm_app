import 'dart:ffi';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sm_app/data/Game.dart';
import 'package:sm_app/screens/DailyShopPage.dart';
import 'package:sm_app/screens/ItemsPage.dart';
import 'package:sm_app/screens/MapsPage.dart';
import 'package:sm_app/screens/UpcomingPage.dart';
import 'package:sm_app/widgets/GameRow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Game> installedGames = games; // TODO: Replace games with real games list
  int currentPage;
  Widget contentWidget;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Position changes container widget.
    // TODO: Separation of Widgets into pages.
    // TODO: Implement Navbar page Swap.

    // TODO: All items

    switch (currentPage) {
      case 0:
        {
          // TODO: Daily Shop
          contentWidget = DailyShopPage();
        }
        break;

      case 1:
        {
          // TODO: Upcoming
          contentWidget = UpcomingPage();
        }
        break;

      case 2:
        {
          // TODO: All Items Page
          contentWidget = ItemsPage();
        }
        break;

      case 3:
        {
          // TODO: Maps
          contentWidget = MapsPage();
        }
        break;

      default:
        {
          contentWidget = Container();
        }
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.red],
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SafeArea(
          child: contentWidget,
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: FontAwesomeIcons.storeAlt, title: "Daily Shop"),
            TabData(iconData: FontAwesomeIcons.clock, title: "Upcoming"),
            TabData(iconData: Icons.format_list_bulleted, title: "All Items"),
            TabData(iconData: FontAwesomeIcons.map, title: "Maps")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
              print(position);
            });
          },
        ),
      ),
    );
  }
}
