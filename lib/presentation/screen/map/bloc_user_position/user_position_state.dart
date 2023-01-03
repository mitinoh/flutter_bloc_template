import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

@immutable
abstract class UserPositionState extends Equatable {
  const UserPositionState();

  @override
  List<Object> get props => [];
}

class UserPositionLoading extends UserPositionState {}

class UserPositionLoaded extends UserPositionState {
  final Position userPosition;
  const UserPositionLoaded(
      {this.userPosition = const Position(
          longitude: 0.0,
          latitude: 0.0,
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          timestamp: null)});
}

class UserPositionError extends UserPositionState {
  final String? message;
  const UserPositionError(this.message);
}
