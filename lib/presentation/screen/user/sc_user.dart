import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/data/repository/auth_repository.dart';
import 'package:flutter_bloc_template/data/repository/user_repository.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/wg_error.dart';
import 'package:flutter_bloc_template/presentation/screen/user/bloc_user/bloc.dart';

import '../../common_widgets/widget_loading_indicator.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key, this.userRef, this.visualOnly = false}) : super(key: key);
  final UserModel? userRef;
  final bool visualOnly;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late BuildContext _blocContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(userRepository: RepositoryProvider.of<UserRepository>(context)),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          _blocContext = context;
          if (state is UserInitial) {
            _setUserData();
            return LoadingIndicator();
          } else if (state is UserDataLoaded) {
            return Text("User page");
          } else {
            return ErrorScreen(state: state);
          }
        },
      ),
    );
  }

  void _setUserData() async {
    String? fid;
    if (widget.userRef == null) {
      AuthRepository authRepository = RepositoryProvider.of<AuthRepository>(_blocContext);
      fid = await authRepository.getUserFid();
    }
    BlocProvider.of<UserBloc>(_blocContext)
      ..add(GetUserData(fid: fid, user: widget.userRef));
  }
}
