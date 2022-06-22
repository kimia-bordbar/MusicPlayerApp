// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/artist_model.dart';

part 'artist_base_model.g.dart';

@JsonSerializable()
class ArtistBaseModel {
  List<Artist> ONLINE_MP3;

  ArtistBaseModel({
    required this.ONLINE_MP3,
  });

  factory ArtistBaseModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistBaseModelToJson(this);
}
