import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/app/auth_bloc/bloc.dart';
import 'package:flutter_bloc_template/presentation/screen/login/widget/wg_login_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(GoogleSignInRequested(context: context));
        },
        child: _buildButton());
  }

  _buildButton() => LoginButton(
        text: "Google"
      );
}
