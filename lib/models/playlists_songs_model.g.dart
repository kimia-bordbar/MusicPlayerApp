// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_songs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListsSongs _$PlayListsSongsFromJson(Map<String, dynamic> json) =>
    PlayListsSongs(
      pid: json['pid'] as String,
      playlist_name: json['playlist_name'] as String,
      playlist_image: json['playlist_image'] as String,
      playlist_image_thumb: json['playlist_image_thumb'] as String,
      songs_list: (json['songs_list'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayListsSongsToJson(PlayListsSongs instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'playlist_name': instance.playlist_name,
      'playlist_image': instance.playlist_image,
      'playlist_image_thumb': instance.playlist_image_thumb,
      'songs_list': instance.songs_list,
    };
