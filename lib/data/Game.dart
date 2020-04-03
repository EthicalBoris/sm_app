import 'dart:io';

import 'package:archive/archive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Game {
  /// Propreties
  String name;
  String imageUrl;
  String type;
  String description;
  String downloadUrl = "";
  bool isDownloading = false;
  bool isInstalled = false;

  static List<Game> installedGames;

  /// Constructors
  Game(this.name);
  Game.withImage(this.name, this.imageUrl);
  Game.full(
      {this.name,
      this.type,
      this.imageUrl,
      this.description,
      this.isInstalled});

  Game.fromSnapshot(DocumentSnapshot gameSnapshot) {
    this.name = gameSnapshot['name'];
    this.imageUrl = gameSnapshot['imageUrl'];
    this.type = gameSnapshot['type'];
    this.description = gameSnapshot['desc'];
    this.downloadUrl = gameSnapshot['download'];
  }

  bool isDownloaded() {
    /// Returns whether or not a game is downloaded
    return false;
  }

  Future<void> downloadGame() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      String downloadDestination =
          "${dir.path}/Installed Games/${this.name}.zip";

      this.isDownloading = true;
      await dio.download(this.downloadUrl, downloadDestination,
          onReceiveProgress: (recieved, total) {
        print("$recieved/$total");

        if (recieved == total) {
          // Download has finished
          this.isDownloading = false;
          print("Finished downloading: ${this.name}");
          this.installGame(downloadDestination);
        }
      });
      /*.then((file) {
        this.installGame(downloadDestination);
      });*/
    } catch (e) {
      // Debug error message
      print(e);
    }
  }

  Future<void> installGame(String filePath) async {
    /*
    - installs game from zip file
    - deletes zip file 
    this ensures that a present zip file is a sign of an unfinished download.
    */

    // Read Zip file from disk
    final bytes = File(filePath).readAsBytesSync();

    // Decode the Zip file
    final archive = ZipDecoder().decodeBytes(bytes);

    Directory dir = await getApplicationDocumentsDirectory();
    // Extract the contents of the Zip archive to disk.
    try {
      for (final archiveFile in archive) {
        final filename = archiveFile.name;
        if (archiveFile.isFile) {
          final data = archiveFile.content as List<int>;
          File('${dir.path}/Installed Games/' + filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory('${dir.path}/Installed Games/' + filename)
            ..create(recursive: true);
        }
      }
    } catch (e) {
      print("Error when installing." + e);
    }

    this.isInstalled = true;
    refreshInstalledGames();
    print('Finished Installing: ${this.name}');
  }

  Future<void> refreshInstalledGames() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Directory installDir = Directory("${dir.path}/Installed Games");
    if (await installDir.exists()) {
      installDir.list().listen((FileSystemEntity entity) {
        print(entity.toString());
        print("Found: ${entity.path}");
      });
    } else {
      print('No installed games');
    }
  }
}

List<Game> games = [
  Game.full(
    name: "Blue Game",
    type: "Adventure",
    imageUrl: "assets/game0.jpg",
    description: "A blue game",
    isInstalled: true,
  ),
  Game.full(
    name: "Purple Game",
    type: "Adventure",
    imageUrl: "assets/game1.jpg",
    description: "A Purple game",
    isInstalled: true,
  ),
  Game.full(
    name: "Lime Game",
    type: "Adventure",
    imageUrl: "assets/game2.jpg",
    description: "A Lime game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    imageUrl: "assets/game3.jpg",
    description: "A Orange game",
    isInstalled: true,
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    imageUrl: "assets/game0.jpg",
    description: "A Orange game",
  ),
  Game.full(
    name: "Orange Game",
    type: "Adventure",
    imageUrl: "assets/game0.jpg",
    description: "A Orange game",
  ),
  Game.full(
    name: "Purple Game",
    type: "Adventure",
    imageUrl: "assets/game0.jpg",
    description: "A Purple game",
  ),
];
