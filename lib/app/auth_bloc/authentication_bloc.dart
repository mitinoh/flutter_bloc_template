import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_template/app/auth_bloc/bloc.dart';
import 'package:flutter_bloc_template/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_template/utils/logger.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc({required this.authRepository}) : super(Uninitialized()) {
    on<AppStarted>(_mapAppStartedToState);
    on<LoggedIn>(_mapLoggedInToState);
    on<LoggedOut>(_mapLoggedOutToState);
    on<GoogleSignInRequested>(_googleSignInRequest);
    on<DeleteAccountRequested>(_deleteRequest);
  }

  void _mapAppStartedToState(AppStarted event, Emitter<AuthenticationState> emit) async {
    try {
      final isSignedIn = await authRepository.isSignedIn();
      await Future.delayed(Duration(seconds: 2));
      authRepository.createUserIfNotExist();
      if (isSignedIn) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } catch (e, stacktrace) {
      emit(AuthError(e.toString()));
      Logger.error(stacktrace.toString());
      emit(Unauthenticated());
    }
  }

  void _mapLoggedInToState(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(Authenticated());
  }

  void _mapLoggedOutToState(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(Unauthenticated());
    authRepository.signOut();
  }

  void _googleSignInRequest(
      GoogleSignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(Unauthenticated());
    UserCredential authResult = await authRepository.signInWithGoogle();
    bool isSignedIn = await authRepository.isSignedIn();

    if (isSignedIn) {
      if (authResult.additionalUserInfo?.isNewUser ?? false)
        emit(AuthenticatedNewUser());
      else
        emit(Authenticated());
    } else
      emit(Unauthenticated());
  }

  void _deleteRequest(
      DeleteAccountRequested event, Emitter<AuthenticationState> emit) async {
    authRepository.deleteUserAccount();
    emit(Unauthenticated());
  }
}
