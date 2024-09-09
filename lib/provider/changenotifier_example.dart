import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangenotifierExample extends StatefulWidget {
  const ChangenotifierExample({super.key});

  @override
  State<ChangenotifierExample> createState() => _ChangenotifierExampleState();
}

class _ChangenotifierExampleState extends State<ChangenotifierExample> {
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
