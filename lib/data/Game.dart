import 'package:flutter/material.dart';

class Game {
  /// Propreties
  String name;
  Image image;

  /// Constructors
  Game(this.name);
  Game.withImage(this.name, this.image);

  bool isDownloaded() {
    /// Returns whether or not a game is downloaded
  }
}
