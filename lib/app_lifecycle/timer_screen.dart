import 'dart:async'; // Pour utiliser la classe Timer
import 'dart:developer';
import 'package:flutter/material.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> with WidgetsBindingObserver {
  Timer? _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _start++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      log("Resumed");
    } else if (state == AppLifecycleState.inactive) {
      log("Inactive");
    } else if (state == AppLifecycleState.detached) {
      log("Detached");
    } else if (state == AppLifecycleState.paused) {
      log("Paused");
    } else if (state == AppLifecycleState.hidden) {
      log("Hidden");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Widget'),
      ),
      body: Center(
        child: Text(
          'Temps écoulé: $_start secondes',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
