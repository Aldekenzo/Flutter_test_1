import 'package:json_annotation/json_annotation.dart';
part 'rest_model.g.dart';
@JsonSerializable()
class RestModel {
  @JsonKey(name: 'is_favourite')
 bool is_favourite;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  RestModel({
    required this.is_favourite,
    required this.id,
    required this.title,
    required this.description});


  factory RestModel.fromJson(Map<String, dynamic> json) =>
      _$RestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestModelToJson(this);
}