import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_template/data/repository/user_repository.dart';
import 'package:flutter_bloc_template/presentation/screen/map/bloc_user_position/bloc.dart';
import 'package:flutter_bloc_template/utils/logger.dart';

class UserPositionBloc extends Bloc<UserPositionEvent, UserPositionState> {
  final UserRepository userRepository;
  UserPositionBloc({required this.userRepository}) : super(UserPositionLoading()) {
    on<GetUserPosition>(_getUserPosition);
  }

  void _getUserPosition(
      GetUserPosition event, Emitter<UserPositionState> emit) async {
    try {
      emit(UserPositionLoaded(
          userPosition: await userRepository.getUserData("user fid")));
    } catch (e, stacktrace) {
      Logger.error(stacktrace.toString());
      emit(UserPositionError(e.toString()));
    }
  }
}
