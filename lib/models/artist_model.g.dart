// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: json['id'] as String,
      artist_name: json['artist_name'] as String,
      artist_image: json['artist_image'] as String,
      artist_image_thumb: json['artist_image_thumb'] as String,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'artist_name': instance.artist_name,
      'artist_image': instance.artist_image,
      'artist_image_thumb': instance.artist_image_thumb,
    };
