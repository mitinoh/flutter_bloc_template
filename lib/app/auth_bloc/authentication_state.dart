import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class AuthenticatedNewUser extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class AuthError extends AuthenticationState {
  final String? message;
  const AuthError(this.message);
}
