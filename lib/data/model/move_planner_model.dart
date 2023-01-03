import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_planner_model.g.dart';

@JsonSerializable()
@CopyWith()
class MovePlannerModel {
  String? locationId;
  DateTime? date;

  MovePlannerModel({this.locationId, this.date});

  factory MovePlannerModel.fromJson(Map<String, dynamic> json) =>
      _$MovePlannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovePlannerModelToJson(this);
}
