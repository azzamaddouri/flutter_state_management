import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatefulWidget {
  const ProviderExample({super.key});

  @override
  State<ProviderExample> createState() => _LearnProviderState();
}

class _LearnProviderState extends State<ProviderExample> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child: const Scaffold(
          body: WidgetChild(),
        ));
  }
}

class WidgetChild extends StatelessWidget {
  const WidgetChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Similar to context.read<Model>().name
    //var model = Provider.of<Model>(context, listen: false);
    // Similar to context.watch<Model>().name
    // var model1 = Provider.of<Model>(context, listen: true);

    return Column(
      children: [
        Center(
          child: Text(context.watch<Model>().name /* model.name */),
        ),
        const SizedBox(height: 30),
        MaterialButton(
          onPressed: () {
            //model.changeName();
            context.read<Model>().changeName();
          },
          child: const Text('Do Something'),
        )
      ],
    );
  }
}

class Model extends ChangeNotifier {
  String name = "welcome";
  changeName() {
    name = "Weal";
    notifyListeners();
  }
}
