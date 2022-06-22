// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/song_model.dart';

part 'playlists_songs_model.g.dart';

@JsonSerializable()
class PlayListsSongs {
  String pid;
  String playlist_name;
  String playlist_image;
  String playlist_image_thumb;
  List<Song> songs_list;
  PlayListsSongs({
    required this.pid,
    required this.playlist_name,
    required this.playlist_image,
    required this.playlist_image_thumb,
    required this.songs_list,
  });
 

  factory PlayListsSongs.fromJson(Map<String, dynamic> json) =>
      _$PlayListsSongsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListsSongsToJson(this);
}
