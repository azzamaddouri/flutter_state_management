abstract class CounterCubitState {
  final int counterValue;

  const CounterCubitState({required this.counterValue});
}

class CounterInitialCubitState extends CounterCubitState {
  CounterInitialCubitState() : super(counterValue: 0);
}

class CounterIncrementCubitState extends CounterCubitState {
  CounterIncrementCubitState(int incrementValue)
      : super(counterValue: incrementValue);
}

class CounterDecrementCubitState extends CounterCubitState {
  CounterDecrementCubitState(int decrementValue)
      : super(counterValue: decrementValue);
}
