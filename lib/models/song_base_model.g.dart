// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongBaseModel _$SongBaseModelFromJson(Map<String, dynamic> json) =>
    SongBaseModel(
      ONLINE_MP3: (json['ONLINE_MP3'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SongBaseModelToJson(SongBaseModel instance) =>
    <String, dynamic>{
      'ONLINE_MP3': instance.ONLINE_MP3,
    };
