import 'dart:developer';

import 'package:flutter_state_management/redux/redux/actions.dart';
import 'package:flutter_state_management/redux/redux/store.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  log("_In the middleware_");
  if (action is UpdateKm) {
    String cleanedString = '';
    for (String c in action.payload.split('')) {
      if (isNumeric(c)) {
        log("Adding $c to cleanedString");
        cleanedString += c;
        log("cleanedString is $cleanedString");
      } else {
        log("$c is not recognized as numeric");
      }
    }
    store.dispatch(UpdateKmCleaned(payload: cleanedString));
  } else if (action is Convert) {
    double kmAsDouble = double.parse(store.state.km);
    double milesAsDouble = kmAsDouble * 0.621371;
    store.dispatch(UpdateMiles(payload: milesAsDouble.toString()));
  }

  next(action);
}

bool isNumeric(String c) {
  /// isNumeric takes a string of length 1
  /// returns true if string is numeric, returns false otherwise

  return c.compareTo('0') >= 0 && c.compareTo('9') <= 0;
}
