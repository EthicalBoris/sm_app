import 'package:flutter/material.dart';

class Game {
  /// Propreties
  String name;
  Image image;
  String type;
  String description;

  /// Constructors
  Game(this.name);
  Game.withImage(this.name, this.image);
  Game.full({
    this.name,
    this.type,
    this.image,
    this.description,
  });

  bool isDownloaded() {
    /// Returns whether or not a game is downloaded
    return false;
  }
}

List<Game> games = [
  Game.full(
    name: "Blue Game",
    type: "Adventure",
    image: Image.asset("Game0.jpg"),
    description: "A blue game",
  ),
  Game.full(
    name: "Purple Game",
    type: "Adventure",
    image: Image.asset("Game0.jpg"),
    description: "A Purple game",
  ),
  Game.full(
    name: "Lime Game",
    type: "Adventure",
    image: Image.asset("Game0.jpg"),
    description: "A Lime game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    image: Image.asset("Game0.jpg"),
    description: "A Orange game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    image: Image.asset("Game0.jpg"),
    description: "A Orange game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    image: Image.asset("Game0.jpg"),
    description: "A Orange game",
  ),
];
