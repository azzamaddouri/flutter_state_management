import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidgetExample extends StatefulWidget {
  const ProviderWidgetExample({super.key});

  @override
  State<ProviderWidgetExample> createState() => _ProviderWidgetExampleState();
}

class _ProviderWidgetExampleState extends State<ProviderWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(
      create: (context) {
        return MyModel();
      },
      child: Scaffold(
          body: Column(
        children: [
          Consumer<MyModel>(
            builder: (context, myModel, child) {
              if (kDebugMode) {
                print("Consumer 1");
              }
              return Text(myModel.showSomething);
            },
          ),
          const SizedBox(height: 30),
          Consumer<MyModel>(
            builder: (context, myModel, child) {
              if (kDebugMode) {
                print("Consumer 2");
              }
              return MaterialButton(
                onPressed: () {
                  myModel.doSomethingOne();
                },
                child: const Text('Do Something 1'),
              );
            },
          ),
          Consumer<MyModel>(
            builder: (context, myModel, child) {
              if (kDebugMode) {
                print("Consumer 3");
              }
              return MaterialButton(
                onPressed: () {
                  myModel.doSomethingTwo();
                },
                child: const Text('Do Something 2'),
              );
            },
          ),
        ],
      )),
    );
  }
}

class MyModel {
  var showSomething = "Show Something";
  doSomethingOne() {
    showSomething = "Providers yes one";
    if (kDebugMode) {
      print(showSomething);
    }
  }

  doSomethingTwo() {
    showSomething = "Providers yes two";
    if (kDebugMode) {
      print(showSomething);
    }
  }
}
