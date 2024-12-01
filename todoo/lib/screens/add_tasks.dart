import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoo/Controllers/taskController.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newtaskTitle = '';
    final taskcontroller = Get.find<Taskcontroller>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Add new task here',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          cursorColor: Colors.green,
          onChanged: (newText) {
            newtaskTitle = newText;
          },
        ),
        const SizedBox(height: 20),
        Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
                onPressed: () {
                  taskcontroller.addTask(newtaskTitle);
                  Get.back();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )))
      ],
    );
  }
}
