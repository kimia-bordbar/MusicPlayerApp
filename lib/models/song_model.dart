// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'song_model.g.dart';

@JsonSerializable()
class Song {
  String id;
  String cat_id;
  String mp3_type;
  String mp3_title;
  String mp3_url;
  String mp3_thumbnail_b;
  String mp3_thumbnail_s;
  String mp3_duration;
  String mp3_artist;
  String mp3_description;
  String total_rate;
  String rate_avg;
  String total_views;
  String total_download;
  String cid;
  String category_name;
  String category_image;
  String category_image_thumb;
  Song({
    required this.id,
    required this.cat_id,
    required this.mp3_type,
    required this.mp3_title,
    required this.mp3_url,
    required this.mp3_thumbnail_b,
    required this.mp3_thumbnail_s,
    required this.mp3_duration,
    required this.mp3_artist,
    required this.mp3_description,
    required this.total_rate,
    required this.rate_avg,
    required this.total_views,
    required this.total_download,
    required this.cid,
    required this.category_name,
    required this.category_image,
    required this.category_image_thumb,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}
