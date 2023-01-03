import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';
import 'package:flutter_bloc_template/data/repository/user_repository.dart';
import 'package:flutter_bloc_template/presentation/screen/user/bloc_user/bloc.dart';
import 'package:flutter_bloc_template/utils/logger.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetUserData>(_getUserData);
  }


  void _getUserData(GetUserData event, Emitter<UserState> emit) async {
    try {
      late UserModel userData;
      if (event.fid != null) {
        userData = await userRepository.getUserData(event.fid!);
      } else {
        userData = event.user!;
      }
      emit(UserDataLoaded(userData: userData));
    } catch (e, stacktrace) {
      Logger.error(stacktrace.toString());

      emit(UserDataLoaded(userData: UserModel()));
    }
  }

}
