import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/data/model/location_model.dart';

@immutable
abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapLocationInitial extends MapState {}

class MapLocationLoading extends MapState {}

class MapLocationLoaded extends MapState {
  final List<LocationModel> locationList;
  const MapLocationLoaded({this.locationList = const <LocationModel>[]});

  @override
  List<Object> get props => locationList;
}

class MapError extends MapState {
  final String? message;
  const MapError(this.message);
}