import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiproviderExample extends StatefulWidget {
  const MultiproviderExample({super.key});

  @override
  State<MultiproviderExample> createState() => _MultiproviderExampleState();
}

class _MultiproviderExampleState extends State<MultiproviderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) {
                return MyModel();
              },
            )
          ],
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

class MyModel with ChangeNotifier {
  var showSomething = "Show Something";
  doSomethingOne() {
    showSomething = "Providers yes one";
    print(showSomething);
    notifyListeners();
  }

  doSomethingTwo() {
    showSomething = "Providers yes two";
    print(showSomething);
    notifyListeners();
  }
}
