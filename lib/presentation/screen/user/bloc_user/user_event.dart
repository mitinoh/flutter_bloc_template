import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserInfo extends UserEvent {
  final Map<String, dynamic> map;
  const UpdateUserInfo(this.map);
}

class GetUserData extends UserEvent {
  final String? fid;
  final UserModel? user;
  const GetUserData({this.fid, this.user});
}

class UpdateUserData extends UserEvent {
  final UserModel newUserData;
  const UpdateUserData({required this.newUserData});
}

class CreateNewUser extends UserEvent {
  final UserModel userData;
  const CreateNewUser({required this.userData});
}