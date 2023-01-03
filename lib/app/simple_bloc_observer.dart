import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_template/utils/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.success(event?.toString() ?? '');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    Logger.error( error.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.info('currentState=${transition.currentState}\n'
        'nextState=${transition.nextState}');
  }
}
