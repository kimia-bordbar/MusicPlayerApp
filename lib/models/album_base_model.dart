// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/album_model.dart';

part 'album_base_model.g.dart';

@JsonSerializable()
class AlbumBaseModel {
  List<Album> ONLINE_MP3;

  AlbumBaseModel({
    required this.ONLINE_MP3,
  });

  factory AlbumBaseModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumBaseModelToJson(this);
}
