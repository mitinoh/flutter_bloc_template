import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class NewUser extends AuthenticationEvent {}

class DeleteAccountRequested extends AuthenticationEvent {}

class GoogleSignInRequested extends AuthenticationEvent {
  final BuildContext context;
  GoogleSignInRequested({required this.context});
}

class AppleSignInRequested extends AuthenticationEvent {
  final BuildContext context;
  AppleSignInRequested({required this.context});
}


