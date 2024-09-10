import 'dart:developer';

import 'package:flutter/material.dart';

// Lifecycle of a stateful widget
class CounterScreen extends StatefulWidget {
  final int counter;
  const CounterScreen({super.key, required this.counter});

  // 1- create the state object
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  // 2- initialize the widget
  @override
  void initState() {
    _counter = widget.counter;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // 3- Everytime a dependency changes
  @override
  void didChangeDependencies() {
    log("Dependency Changed");
    super.didChangeDependencies();
  }

  // 5- Update the data of a parent widget
  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.counter != widget.counter) {
      log("Widget Updated");
    }
  }

// 6- Parent widget is removed from the widget tree
  @override
  void deactivate() {
    super.deactivate();
  }

  // 7- Destroy the widget
  @override
  void dispose() {
    log("Dispose State");
    super.dispose();
  }

  // 4- build --> Creates our ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter value:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('-'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
