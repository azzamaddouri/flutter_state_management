import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderExample extends StatefulWidget {
  const ChangeNotifierProviderExample({super.key});

  @override
  State<ChangeNotifierProviderExample> createState() =>
      _ChangeNotifierProviderExampleState();
}

class _ChangeNotifierProviderExampleState
    extends State<ChangeNotifierProviderExample> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child: Scaffold(
          body: Consumer<Model>(
            builder: (context, model, child) {
              return Column(
                children: [
                  Center(
                    child: Text(model.name),
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      model.changeName();
                    },
                    child: const Text('Do Something'),
                  )
                ],
              );
            },
          ),
        ));
  }
}

class Model extends ChangeNotifier {
  String name = "welcome";
  changeName() {
    name = "Weal";
    // Similar to setState() -> rebuild consumer which listens to the same class
    notifyListeners();
  }
}
