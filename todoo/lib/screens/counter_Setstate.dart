import 'package:flutter/material.dart';

class SetStateCounter extends StatefulWidget {
  const SetStateCounter({super.key});

  @override
  State<SetStateCounter> createState() => _SetCounterState();
}

class _SetCounterState extends State<SetStateCounter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState counter example'),
      ),
      body: Center(
          child: Text(
        'Counter: $counter',
        style: const TextStyle(fontSize: 35),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
