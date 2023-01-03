import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/app/app.dart';
import 'package:flutter_bloc_template/app/auth_bloc/bloc.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/sb_error.dart';
import 'package:flutter_bloc_template/presentation/screen/login/widget/wg_login_form.dart';

class LoginScreen extends StatelessWidget {
  late ThemeData themex;
  @override
  Widget build(BuildContext ct) {
    themex = Theme.of(ct);
    return Scaffold(
      backgroundColor: themex.canvasColor,
      body: SafeArea(
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          _blocListener(context, state);
        }, builder: (context, state) {
          return _blocBuilder(context, state);
        }),
      ),
    );
  }

  _blocListener(BuildContext context, AuthenticationState state) {
    if (state is Authenticated) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => App()));
    }
    if (state is AuthError) {
      SbError().show(context);
    }
  }

  _blocBuilder(BuildContext context, AuthenticationState state) => _buildLoginForm();

  _buildLoginForm() => WidgetLoginForm();
}
