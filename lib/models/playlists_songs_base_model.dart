// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/playlists_songs_model.dart';

part 'playlists_songs_base_model.g.dart';

@JsonSerializable()
class PlaylistsSongsBaseModel {
  List<PlayListsSongs> ONLINE_MP3;

  PlaylistsSongsBaseModel({
    required this.ONLINE_MP3,
  });

  factory PlaylistsSongsBaseModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistsSongsBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistsSongsBaseModelToJson(this);
}
