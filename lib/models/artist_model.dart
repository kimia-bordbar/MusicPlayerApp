// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'artist_model.g.dart';

@JsonSerializable()
class Artist {
  String id;
  String artist_name;
  String artist_image;
  String artist_image_thumb;
  Artist({
    required this.id,
    required this.artist_name,
    required this.artist_image,
    required this.artist_image_thumb,
  });

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
