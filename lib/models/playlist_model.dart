// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'playlist_model.g.dart';

@JsonSerializable()
class PlayList {
  String pid;
  String playlist_name;
  String playlist_image;
  String playlist_image_thumb;
  PlayList({
    required this.pid,
    required this.playlist_name,
    required this.playlist_image,
    required this.playlist_image_thumb,
  });
 

  factory PlayList.fromJson(Map<String, dynamic> json) =>
      _$PlayListFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListToJson(this);
}
