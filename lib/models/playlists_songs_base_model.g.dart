// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_songs_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistsSongsBaseModel _$PlaylistsSongsBaseModelFromJson(
        Map<String, dynamic> json) =>
    PlaylistsSongsBaseModel(
      ONLINE_MP3: (json['ONLINE_MP3'] as List<dynamic>)
          .map((e) => PlayListsSongs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistsSongsBaseModelToJson(
        PlaylistsSongsBaseModel instance) =>
    <String, dynamic>{
      'ONLINE_MP3': instance.ONLINE_MP3,
    };
