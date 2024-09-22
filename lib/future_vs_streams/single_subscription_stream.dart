import 'dart:async';
import 'package:flutter/material.dart';

class StreamCounter extends StatefulWidget {
  const StreamCounter({super.key});

  @override
  State<StreamCounter> createState() => _StreamCounterState();
}

class _StreamCounterState extends State<StreamCounter> {
  // StreamController pipe has 2 opennings:
  //one --> the entrance of the data = sink 
  //and other --> the evacuation of data = stream
  final StreamController<int> _streamController = StreamController<int>();
  late Stream<int> _counterStream;

  @override
  void initState() {
    super.initState();
    _counterStream = _streamController.stream;
    startCounting();
  }

  // I'm not creating the stream
  void startCounting() {
    int count = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      if (count <= 30) {
        _streamController.sink.add(count);
      } else {
        timer.cancel();
        _streamController.close();
      }
    });
  }

  // I'm creating the stream
  Stream<int> countTo30() async* {
    for (int i = 1; i <= 30; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i; // return while the function is excuting
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Counter'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Compteur : ${snapshot.data}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
