// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class Category {
  String cid;
  String category_name;
  String category_image;
  String category_image_thumb;
  Category({
    required this.cid,
    required this.category_name,
    required this.category_image,
    required this.category_image_thumb,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
