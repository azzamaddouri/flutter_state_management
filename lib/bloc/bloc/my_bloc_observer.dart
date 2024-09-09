import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

// Debug States --> Where I was , from where etc (Show basic information about the bloc)
class MyBlocObserver extends BlocObserver {
  // Which event and bloc I'm working with
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log("${bloc.runtimeType} $event");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log("$error");
  }

  // Change of state , currentState --> nextState
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("Change : $change");
  }

  // currentState --> event --> nextState
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log("Transition : $transition");
  }
}
