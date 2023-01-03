import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UpdatedUserInfo extends UserState {
  const UpdatedUserInfo();
}

class UserDataLoaded extends UserState {
  final UserModel userData;
  const UserDataLoaded({required this.userData});

  @override
  List<Object> get props => [userData];
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
