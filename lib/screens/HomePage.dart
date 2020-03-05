import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(     
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "App Header",
            style: TextStyle(fontSize: 30),
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.blueGrey],
              ),
            ),
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Card(
                child: Text(
                  "Test",
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
