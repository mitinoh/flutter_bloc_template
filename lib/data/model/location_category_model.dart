import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'location_category_model.g.dart';

@JsonSerializable()
class LocationCategoryModel extends Equatable  {
  @JsonKey(name: '_id')
  String? id;
  String? name;

  LocationCategoryModel({required this.id, this.name});

  factory LocationCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$LocationCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationCategoryModelToJson(this);
  
  @override
  List<Object> get props => [id ?? '', name ?? ''];
}
