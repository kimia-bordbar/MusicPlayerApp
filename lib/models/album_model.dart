// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class Album {
  String aid;
  String album_name;
  String album_image;
  String album_image_thumb;
  Album({
    required this.aid,
    required this.album_name,
    required this.album_image,
    required this.album_image_thumb,
  });
  

  factory Album.fromJson(Map<String, dynamic> json) =>
      _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
