import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/app/app.dart';
import 'package:flutter_bloc_template/app/simple_bloc_observer.dart';
import 'package:flutter_bloc_template/app_config.dart';
import 'package:flutter_bloc_template/presentation/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  App.initSystemDefault();
  BlocOverrides.runZoned(
    () => runApp(AppConfig(
      appName: "Foo",
      debugTag: false,
      flavorName: "production",
      initialRoute: AppRouter.SPLASH,
      child: App.runWidget(),
    )),
    blocObserver: SimpleBlocObserver(),
  );
}
