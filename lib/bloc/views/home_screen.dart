import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/bloc/bloc_imports.dart';
import 'package:flutter_state_management/cubit/counter_cubit.dart';
import 'package:flutter_state_management/cubit/counter_cubit_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Bloc:',
              style: TextStyle(fontSize: 24),
            ),
            // Rebuild of the widget
            // BlocBuilder<CounterBloc, CounterState>(
            //   builder: (context, state) {
            //     return Text(
            //       '${state.counterValue}',
            //       style: const TextStyle(
            //           fontSize: 48, fontWeight: FontWeight.bold),
            //     );
            //   },
            // ),
            // Perform side effects in response to state changes like ---> Show Snackbar or Dialog
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterIncrementState) {
                  log("State is CounterIncrementState");
                } else if (state is CounterDecrementState) {
                  log("State is CounterDecrementState");
                }
              },
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  log("rebuid");
                  return Text(
                    '${state.counterValue}',
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            //  Combination of BlocListner + BlocBuilder
            /*  BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterIncrementState) {
                  log("State is CounterIncrementState");
                } else if (state is CounterDecrementState) {
                  log("State is CounterDecrementState");
                }
              },
              builder: (BuildContext context, CounterState state) {
                return Text(
                  '${state.counterValue}',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                );
              },
            ), */
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Call the on method inside the BLoC
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                  },
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Counter Cubit:',
              style: TextStyle(fontSize: 24),
            ),
            BlocBuilder<CounterCubit, CounterCubitState>(
              builder: (BuildContext context, state) {
                return Text(
                  '${state.counterValue}',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
