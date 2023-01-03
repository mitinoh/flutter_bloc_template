import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc_template/app/auth_bloc/bloc.dart';
import 'package:flutter_bloc_template/app_config.dart';
import 'package:flutter_bloc_template/data/model/user_model.dart';
import 'package:flutter_bloc_template/data/repository/home_repository.dart';
import 'package:flutter_bloc_template/data/repository/auth_repository.dart';
import 'package:flutter_bloc_template/data/repository/user_repository.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/sb_error.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/wg_error.dart';
import 'package:flutter_bloc_template/presentation/router.dart';
import 'package:flutter_bloc_template/presentation/screen/login/sc_login.dart';
import 'package:flutter_bloc_template/presentation/screen/map/bloc_map/bloc.dart';
import 'package:flutter_bloc_template/presentation/screen/map/bloc_user_position/bloc.dart';
import 'package:flutter_bloc_template/presentation/screen/splash/sc_splash.dart';
import 'package:flutter_bloc_template/utils/const/COLOR_CONST.dart';
import 'package:flutter_bloc_template/utils/theme.dart';

import '../presentation/screen/home/bloc/bloc.dart';
import '../presentation/screen/user/bloc_user/bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: COLOR_CONST.DEFAULT100));
  }

  static Widget runWidget() {
    WidgetsFlutterBinding.ensureInitialized();
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final AuthRepository authRepository = AuthRepository();
          final UserRepository userRepository = UserRepository();
          final HomeRepository homeRepository = HomeRepository();
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<AuthRepository>(create: (context) => authRepository),
              RepositoryProvider<HomeRepository>(create: (context) => homeRepository),
              RepositoryProvider<UserRepository>(create: (context) => userRepository)
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        AuthenticationBloc(authRepository: authRepository)
                          ..add(AppStarted())),
                BlocProvider(
                    create: (context) => HomeBloc(homeRepository: homeRepository)),
                BlocProvider(
                    create: (context) =>
                        UserPositionBloc(userRepository: userRepository)),
                BlocProvider(
                    create: (context) => MapBloc(locationRepository: homeRepository)),
                BlocProvider(
                    create: (context) => UserBloc(userRepository: userRepository)),
              ],
              child: App(),
            ),
          );
        }

        return Container();
      },
    );
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context)!;
    return MaterialApp(
        debugShowCheckedModeBanner: config.debugTag,
        theme: ThemeX.lightTheme,
        darkTheme: ThemeX.darkTheme, // standard dark theme
        themeMode: ThemeMode.system, // device controls theme
        onGenerateRoute: AppRouter.generateRoute,
        home: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserDataLoaded) {
              //  Navigator.pop(context);
              context.read<AuthenticationBloc>().add(LoggedIn());
            } else if (state is UserError) {
              SbError().show(context, state.message);
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (ct, state) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return ErrorScreen(errorDetails: errorDetails);
              };
              // return Scaffold(body: Navbar());
              if (state is Uninitialized) {
                return SplashScreen();
              } else if (state is Unauthenticated) {
                return LoginScreen();
              } else if (state is Authenticated) {
                return Scaffold(body: Text("Home"));
              } else if (state is AuthenticatedNewUser) {
                return Text("Edit user page");
              } else {
                return ErrorScreen(
                  state: state,
                );
              }
            },
          ),
        ));
  }
}
