// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistBaseModel _$ArtistBaseModelFromJson(Map<String, dynamic> json) =>
    ArtistBaseModel(
      ONLINE_MP3: (json['ONLINE_MP3'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistBaseModelToJson(ArtistBaseModel instance) =>
    <String, dynamic>{
      'ONLINE_MP3': instance.ONLINE_MP3,
    };
