import 'package:flutter/material.dart';
import 'package:todoo/models.dart';
import 'package:todoo/widgets/task_tile.dart';

class tasklist extends StatefulWidget {
  const tasklist({
    super.key,
  });

  @override
  State<tasklist> createState() => _tasklistState();
}

class _tasklistState extends State<tasklist> {
  List<Tasks> tasks = [
    Tasks(name: 'This is task 1'),
    Tasks(name: 'Task is task 2'),
    Tasks(name: 'Task is task 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            Task_title: tasks[index].name,
            isChecked: tasks[index].isDone,
            CheckboxCallBack: (bool? checkboxState) {
              setState(() {
                tasks[index].toggledone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
