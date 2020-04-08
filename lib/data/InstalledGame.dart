import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/data/Game.dart';

class InstalledGame extends Game {
  Directory installDir;
  FileImage thumbnail;

  static List<InstalledGame> installedGames = new List<InstalledGame>();

  InstalledGame(Game game) : super.fromGame(game) {
    installDir = Directory(game.downloadUrl);
    thumbnail = FileImage(File("${game.downloadUrl}/image.jpg"));
  }

  static void deleteGame(int index) {
    installedGames[index].installDir.delete(recursive: true);
    installedGames.removeAt(index);
  }
}
