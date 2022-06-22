// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistBaseModel _$PlaylistBaseModelFromJson(Map<String, dynamic> json) =>
    PlaylistBaseModel(
      ONLINE_MP3: (json['ONLINE_MP3'] as List<dynamic>)
          .map((e) => PlayList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistBaseModelToJson(PlaylistBaseModel instance) =>
    <String, dynamic>{
      'ONLINE_MP3': instance.ONLINE_MP3,
    };
