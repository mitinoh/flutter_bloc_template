import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
@immutable
abstract class UserPositionEvent extends Equatable {
  const UserPositionEvent();

  @override
  List<Object> get props => [];
}

class GetUserPosition extends UserPositionEvent {}
