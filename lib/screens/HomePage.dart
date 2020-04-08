import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BrowsePage.dart';
import 'InstalledPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage;
  Widget contentWidget;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case 0:
        {
          contentWidget = InstalledPage();
        }
        break;

      case 1:
        {
          contentWidget = BrowsePage();
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
            TabData(iconData: Icons.open_in_browser, title: "Installed"),
            TabData(iconData: FontAwesomeIcons.search, title: "Browse"),
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
