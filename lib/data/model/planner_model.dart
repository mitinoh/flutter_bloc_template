import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_bloc_template/data/model/geometry_model.dart';
import 'package:flutter_bloc_template/data/model/location_category_model.dart';
import 'package:flutter_bloc_template/data/model/trip_model.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';

part 'planner_model.g.dart';

@JsonSerializable()
class PlannerModel {
  @JsonKey(name: '_id')
  String? id;
  String? tripName;
  String? destinationName;
  double? distance;
  GeometryModel? geometry;
  List<LocationCategoryModel>? avoidCategory;
  List<TripModel>? plannedLocation;
  UserModel? uid;
  DateTime? returnDate;
  DateTime? goneDate;
  DateTime? cdate;

  PlannerModel(
      {this.id,
      this.uid,
      this.plannedLocation,
      this.destinationName,
      this.returnDate,
      this.geometry,
      this.distance,
      this.avoidCategory,
      this.goneDate,
      this.cdate,
      this.tripName});

  factory PlannerModel.fromJson(Map<String, dynamic> json) =>
      _$PlannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlannerModelToJson(this);
}
