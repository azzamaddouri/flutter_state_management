// A function
import 'package:flutter_state_management/redux/redux/actions.dart';
import 'package:flutter_state_management/redux/redux/store.dart';

AppState reducer(AppState prevState, dynamic action) {
  if (action is UpdateKmCleaned) {
    return prevState.copyWith(km: action.payload);
  } else if (action is UpdateMiles) {
    // ! WRONG, Any operations on data is not allowed here especially async data
    // , not a pure function
    // Middleware , catch an action do something with it before passing an action along to the reducer
    return prevState.copyWith(miles: action.payload);
  } else {
    return prevState.copyWith(km: prevState.km, miles: prevState.miles);
  }
}
