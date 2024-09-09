import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerExample extends StatefulWidget {
  const ConsumerExample({super.key});

  @override
  State<ConsumerExample> createState() => _ConsumerExampleState();
}

class _ConsumerExampleState extends State<ConsumerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<MyModel>(
          create: (context) {
            return MyModel();
          },
          child: Column(
            children: [
              Consumer<MyModel>(
                builder: (context, myModel, child) {
                  print("Consumer 1");
                  return Text(myModel.showSomething);
                },
              ),
              const SizedBox(height: 30),
              Consumer<MyModel>(
                builder: (context, myModel, child) {
                  print("Consumer 2");
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
                  print("Consumer 3");
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
    print(showSomething);
  }

  doSomethingTwo() {
    showSomething = "Providers yes two";
    print(showSomething);
  }
}
