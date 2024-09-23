import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_management/redux/redux/actions.dart';

import '../redux/store.dart';

class ReduxView extends StatelessWidget {
  const ReduxView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, AppState>(
          // Similar to listener
          converter: (store) => store.state,
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Km'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Km',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => StoreProvider.of<AppState>(context)
                        .dispatch(UpdateKm(payload: val))),
              ),
              const Text('Miles'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(state.miles),
              ),
              ElevatedButton(
                onPressed: () =>
                    StoreProvider.of<AppState>(context).dispatch(Convert()),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Redux 3 principales
// 1- Single source of truth (One single store)
// 2- State is read-only (The only way to change the state is to emit an action)
// 3 - Reducers must be pure function (action + previous state -> next state)