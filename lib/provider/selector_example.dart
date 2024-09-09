import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorExample extends StatefulWidget {
  const SelectorExample({super.key});

  @override
  State<SelectorExample> createState() => _SelectorExampleState();
}

class _SelectorExampleState extends State<SelectorExample> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProvOne(),
        child: Scaffold(
            body: ListView(children: [
          Selector<ProvOne, String>(
            selector: (context, provs1) => provs1.showSomethingSelector,
            builder: (context, provOne, child) {
              if (kDebugMode) {
                print("Consumer 1");
              }
              return Text(provOne);
            },
          ),
          Consumer<ProvOne>(
            builder: (context, provOne, child) {
              if (kDebugMode) {
                print("Consumer 2");
              }
              return MaterialButton(
                onPressed: () {
                  provOne.doSomething();
                },
                child: const Text('Do Something'),
              );
            },
          )
        ])));
  }
}

class ProvOne extends ChangeNotifier {
  String showSomething = "Welcome";

  //Selector
  get showSomethingSelector => showSomething;

  doSomething() {
    showSomething = "Do something";
    notifyListeners();
  }
}
