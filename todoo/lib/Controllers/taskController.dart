import 'package:get/get.dart';
import 'package:todoo/models/model_task.dart';

class Taskcontroller extends GetxController {
  final RxList<Tasks> tasks = [
    Tasks(name: 'This is task 1'),
    Tasks(name: 'This is task 2'),
    Tasks(name: 'This is task 3'),
  ].obs;

// this is the getter for the tasks list
  List<Tasks> get tasksdata => tasks;

// this is the getter for the total count of the present tasks
  int get taskCount => tasks.length;

// this function will be used to add a new task

  void addTask(String newtaskTitle) {
    final addtask = Tasks(name: newtaskTitle);
    tasks.add(addtask);
  }

  void updateTask(Tasks addtask) {
    addtask.toggleDone();
    tasks.refresh();
  }

  void deleteTask(Tasks addtask) {
    tasks.remove(addtask);
  }
}
