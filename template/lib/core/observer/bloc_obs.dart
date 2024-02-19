import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent bloc => ${bloc.runtimeType}, event: ${event?.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError bloc => ${bloc.runtimeType},'
        ' error: $error, stackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange bloc => ${bloc.runtimeType}, '
        // ignore: avoid_dynamic_calls
        'current: ${change.currentState.runtimeType},'
        // ignore: avoid_dynamic_calls
        ' next: ${change.nextState.runtimeType}');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition bloc => ${bloc.runtimeType},'
        // ignore: avoid_dynamic_calls
        ' event: ${transition.event.runtimeType},'
        // ignore: avoid_dynamic_calls
        ' current: ${transition.currentState.runtimeType},'
        // ignore: avoid_dynamic_calls
        ' next: ${transition.nextState.runtimeType}');
    super.onTransition(bloc, transition);
  }
}
