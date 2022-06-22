// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:music_player/models/song_model.dart';

part 'song_base_model.g.dart';

@JsonSerializable()
class SongBaseModel {
  List<Song> ONLINE_MP3;

  SongBaseModel({
    required this.ONLINE_MP3,
  });

  factory SongBaseModel.fromJson(Map<String, dynamic> json) =>
      _$SongBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SongBaseModelToJson(this);
}
