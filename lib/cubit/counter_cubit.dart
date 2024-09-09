import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/cubit/counter_cubit_state.dart';

// Based on functions
class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterInitialCubitState());

  void increment() {
    emit(CounterIncrementCubitState(state.counterValue + 1));
  }

  void decrement() {
    emit(CounterDecrementCubitState(state.counterValue - 1));
  }
}
