// You have a part of the counter event
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// Pure BloC // BloC is stream
class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterInitialState() /* initial state of the BLoC when it is first created */) {
    on<CounterIncrementEvent>((event, emit) {
      // Equal to setState()
      emit(CounterIncrementState(state.counterValue + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.counterValue - 1));
    });
  }
}
