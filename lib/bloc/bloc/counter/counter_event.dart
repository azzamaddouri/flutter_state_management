// event is a part og the bloc
part of 'counter_bloc.dart';

abstract class CounterEvents {}

class CounterIncrementEvent extends CounterEvents {}

class CounterDecrementEvent extends CounterEvents {}
