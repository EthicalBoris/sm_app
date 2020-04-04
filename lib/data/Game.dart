import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;

import 'package:archive/archive.dart';

part 'Game.g.dart';

@JsonSerializable()
class Game {
  /// Propreties
  String name;
  String imageUrl;
  String type;
  String description;
  String downloadUrl = "";
  bool isDownloading = false;
  bool isInstalled = false;

  static List<Game> installedGames = new List<Game>();

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
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
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
    // TODO: delete zip file
    
    print('Finished Installing: ${this.name}');

    // store game in json format.
    String gameJson = jsonEncode(this);
    File jsonFile = File("${dir.path}/Installed Games/${this.name}/json.json");
    jsonFile.writeAsString(gameJson);
    print('Serialised: ${this.name}');

    this.isInstalled = true; 


    refreshInstalledGames();
  }

  static Future<void> refreshInstalledGames() async {
    // Refreshes the installed games list
    Directory dir = await getApplicationDocumentsDirectory();
    Directory installDir = Directory("${dir.path}/Installed Games");

    installedGames.clear();

    if (await installDir.exists()) {
      installDir.list().listen((FileSystemEntity entity) {
        print("File: " + p.basename(entity.toString()));
        print("Found: ${entity.path}");
      });
    } else {
      print('No installed games');
    }
  }
}
