import 'package:flutter/material.dart';

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Upcoming",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
