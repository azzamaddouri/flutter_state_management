import 'dart:async';
import 'package:flutter/material.dart';

class FutureCounter extends StatefulWidget {
  const FutureCounter({super.key});

  @override
  State<FutureCounter> createState() => _FutureCounterState();
}

class _FutureCounterState extends State<FutureCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    startCounting();
  }

  Future<void> startCounting() async {
    for (int i = 1; i <= 30; i++) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _counter = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Counter'),
      ),
      body: Center(
        child: Text(
          'Compteur : $_counter',
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
