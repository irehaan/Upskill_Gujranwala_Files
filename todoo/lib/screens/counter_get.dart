import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoo/getcontroller.dart';

class GetCounterScreen extends StatefulWidget {
  const GetCounterScreen({super.key});

  @override
  State<GetCounterScreen> createState() => _GetCounterScreenState();
}

class _GetCounterScreenState extends State<GetCounterScreen> {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('GetX counter example'),
      ),
      body: Center(
          child: Obx(() => Text(
                'counter :${counterController.counter}',
                style: const TextStyle(fontSize: 35),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
