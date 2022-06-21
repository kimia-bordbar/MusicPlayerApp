// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayList _$PlayListFromJson(Map<String, dynamic> json) => PlayList(
      pid: json['pid'] as String,
      playlist_name: json['playlist_name'] as String,
      playlist_image: json['playlist_image'] as String,
      playlist_image_thumb: json['playlist_image_thumb'] as String,
    );

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'pid': instance.pid,
      'playlist_name': instance.playlist_name,
      'playlist_image': instance.playlist_image,
      'playlist_image_thumb': instance.playlist_image_thumb,
    };
