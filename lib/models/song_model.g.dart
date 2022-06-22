// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      id: json['id'] as String,
      cat_id: json['cat_id'] as String,
      mp3_type: json['mp3_type'] as String,
      mp3_title: json['mp3_title'] as String,
      mp3_url: json['mp3_url'] as String,
      mp3_thumbnail_b: json['mp3_thumbnail_b'] as String,
      mp3_thumbnail_s: json['mp3_thumbnail_s'] as String,
      mp3_duration: json['mp3_duration'] as String,
      mp3_artist: json['mp3_artist'] as String,
      mp3_description: json['mp3_description'] as String,
      total_rate: json['total_rate'] as String,
      rate_avg: json['rate_avg'] as String,
      total_views: json['total_views'] as String,
      total_download: json['total_download'] as String,
      cid: json['cid'] as String,
      category_name: json['category_name'] as String,
      category_image: json['category_image'] as String,
      category_image_thumb: json['category_image_thumb'] as String,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'cat_id': instance.cat_id,
      'mp3_type': instance.mp3_type,
      'mp3_title': instance.mp3_title,
      'mp3_url': instance.mp3_url,
      'mp3_thumbnail_b': instance.mp3_thumbnail_b,
      'mp3_thumbnail_s': instance.mp3_thumbnail_s,
      'mp3_duration': instance.mp3_duration,
      'mp3_artist': instance.mp3_artist,
      'mp3_description': instance.mp3_description,
      'total_rate': instance.total_rate,
      'rate_avg': instance.rate_avg,
      'total_views': instance.total_views,
      'total_download': instance.total_download,
      'cid': instance.cid,
      'category_name': instance.category_name,
      'category_image': instance.category_image,
      'category_image_thumb': instance.category_image_thumb,
    };
