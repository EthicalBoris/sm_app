import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Game {
  /// Propreties
  String name;
  String image;
  String type;
  String description;
  bool isInstalled = false;

  /// Constructors
  Game(this.name);
  Game.withImage(this.name, this.image);
  Game.full(
      {this.name, this.type, this.image, this.description, this.isInstalled});

  Game.fromSnapshot(DocumentSnapshot gameSnapshot) {
    this.name = gameSnapshot['name'];
    this.image = gameSnapshot['image'];
    this.type = gameSnapshot['type'];
    this.description = gameSnapshot['desc'];
  }

  bool isDownloaded() {
    /// Returns whether or not a game is downloaded
    return false;
  }
}

List<Game> games = [
  Game.full(
    name: "Blue Game",
    type: "Adventure",
    image: "assets/game0.jpg",
    description: "A blue game",
    isInstalled: true,
  ),
  Game.full(
    name: "Purple Game",
    type: "Adventure",
    image: "assets/game1.jpg",
    description: "A Purple game",
    isInstalled: true,
  ),
  Game.full(
    name: "Lime Game",
    type: "Adventure",
    image: "assets/game2.jpg",
    description: "A Lime game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    image: "assets/game3.jpg",
    description: "A Orange game",
    isInstalled: true,
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    image: "assets/game0.jpg",
    description: "A Orange game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    image: "assets/game0.jpg",
    description: "A Orange game",
  ),
  Game.full(
    name: "Purple Game",
    type: "Adventure",
    image: "assets/game0.jpg",
    description: "A Purple game",
  ),
];
