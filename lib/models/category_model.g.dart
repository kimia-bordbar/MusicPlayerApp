// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      cid: json['cid'] as String,
      category_name: json['category_name'] as String,
      category_image: json['category_image'] as String,
      category_image_thumb: json['category_image_thumb'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'cid': instance.cid,
      'category_name': instance.category_name,
      'category_image': instance.category_image,
      'category_image_thumb': instance.category_image_thumb,
    };
