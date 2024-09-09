part of 'counter_bloc.dart';

abstract class CounterState {
  final int counterValue;

  const CounterState({required this.counterValue});
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counterValue: 0);
}

class CounterIncrementState extends CounterState {
  CounterIncrementState(int incrementValue)
      : super(counterValue: incrementValue);
}

class CounterDecrementState extends CounterState {
  CounterDecrementState(int decrementValue)
      : super(counterValue: decrementValue);
}
