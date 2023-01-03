import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/data/model/location_model.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
   List<LocationModel> homeList;
   HomeLoaded({required this.homeList});

  @override
  List<Object> get props => homeList;
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
