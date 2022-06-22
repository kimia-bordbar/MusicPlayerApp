// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:music_player/models/category_model.dart';

part 'category_base_model.g.dart';

@JsonSerializable()
class CategoryBaseModel {
  List<Category> ONLINE_MP3;

  CategoryBaseModel({
    required this.ONLINE_MP3,
  });

  factory CategoryBaseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBaseModelToJson(this);
}
