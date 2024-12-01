import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoo/Controllers/taskController.dart';
import 'package:todoo/models/model_task.dart';
import 'package:todoo/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskcontroller = Get.find<Taskcontroller>();

    return Obx(() {
      return ListView.builder(
        itemBuilder: (context, index) {
          final tasksdata = taskcontroller.tasks[index];
          return TaskTile(
            Task_title: tasksdata.name,
            isChecked: tasksdata.isDone,
            CheckboxCallBack: (checkboxState) {
              taskcontroller.updateTask(tasksdata);
            },
            longPressCallback: () {
              taskcontroller.deleteTask(tasksdata);
            },
          );
        },
        itemCount: taskcontroller.taskCount,
      );
    });
  }
}
