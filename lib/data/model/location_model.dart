import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_bloc_template/data/model/geometry_model.dart';
import 'package:flutter_bloc_template/data/model/location_category_model.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  GeometryModel? geometry;
  List<LocationCategoryModel>? locationCategory;
  String? desc;
  String? indication;
  bool? saved;
  UserModel? uid;
  String? base64;
  String? address;

  LocationModel(
      {this.id,
      this.name,
      this.geometry,
      this.locationCategory,
      this.desc,
      this.indication,
      this.saved,
      this.uid,
      this.base64,
      this.address});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
