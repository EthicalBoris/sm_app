import 'package:flutter/material.dart';
import 'package:sm_app/screens/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sm_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
        backgroundColor: Colors.blueAccent,
      ),
      home: HomePage(),
    );
  }
}
