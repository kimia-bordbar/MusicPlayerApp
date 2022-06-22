// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/playlist_model.dart';

part 'playlist_base_model.g.dart';

@JsonSerializable()
class PlaylistBaseModel {
  List<PlayList> ONLINE_MP3;

  PlaylistBaseModel({
    required this.ONLINE_MP3,
  });

  factory PlaylistBaseModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistBaseModelToJson(this);
}
