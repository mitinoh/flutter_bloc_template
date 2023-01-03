import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/app/app.dart';
import 'package:flutter_bloc_template/presentation/screen/home/sc_home.dart';
import 'package:flutter_bloc_template/presentation/screen/login/sc_login.dart';
import 'package:flutter_bloc_template/presentation/screen/map/screen/sc_map.dart';
import 'package:flutter_bloc_template/presentation/screen/splash/sc_splash.dart';
import 'package:flutter_bloc_template/presentation/screen/user/sc_user.dart';

class AppRouter {
  static const String APP = '/app';
  static const String HOME = '/home';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String USER = '/user';
  static const String MAP = '/map';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case APP:
        return MaterialPageRoute(builder: (_) => App());
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case USER:
        return MaterialPageRoute(builder: (_) => UserScreen());
      case MAP:
        return MaterialPageRoute(builder: (_) => MapScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
