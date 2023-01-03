import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_bloc_template/data/enum/geo_json_type.dart';

part 'geometry_model.g.dart';

@JsonSerializable()
class GeometryModel {


  GeoJSONType? type; 
  List<double>? coordinates;

  GeometryModel({required this.type, this.coordinates});

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}
