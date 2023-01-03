import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';

@immutable
abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}
/*
class MapGetLocationListEvent extends MapEvent {
  final double latitude;
  final double longitude;
  final double zoom;
  final List<LocationModel> mapLocationList;
  const MapGetLocationListEvent(
      {required this.mapLocationList,
      required this.latitude,
      required this.longitude,
      required this.zoom});

  @override
  List<Object> get props => mapLocationList;
}
*/

class MapGetLocationList extends MapEvent {
  final MapPosition currentMapPosition;
  const MapGetLocationList({required this.currentMapPosition});
}
