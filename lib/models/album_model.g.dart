// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      aid: json['aid'] as String,
      album_name: json['album_name'] as String,
      album_image: json['album_image'] as String,
      album_image_thumb: json['album_image_thumb'] as String,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'aid': instance.aid,
      'album_name': instance.album_name,
      'album_image': instance.album_image,
      'album_image_thumb': instance.album_image_thumb,
    };
