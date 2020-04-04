// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    json['name'] as String,
  )
    ..imageUrl = json['imageUrl'] as String
    ..type = json['type'] as String
    ..description = json['description'] as String
    ..downloadUrl = json['downloadUrl'] as String
    ..isDownloading = json['isDownloading'] as bool
    ..isInstalled = json['isInstalled'] as bool;
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'description': instance.description,
      'downloadUrl': instance.downloadUrl,
      'isDownloading': instance.isDownloading,
      'isInstalled': instance.isInstalled,
    };
