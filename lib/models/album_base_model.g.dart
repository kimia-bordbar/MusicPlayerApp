// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumBaseModel _$AlbumBaseModelFromJson(Map<String, dynamic> json) =>
    AlbumBaseModel(
      ONLINE_MP3: (json['ONLINE_MP3'] as List<dynamic>)
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumBaseModelToJson(AlbumBaseModel instance) =>
    <String, dynamic>{
      'ONLINE_MP3': instance.ONLINE_MP3,
    };
