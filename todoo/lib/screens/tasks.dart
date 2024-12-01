import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoo/Controllers/taskController.dart';
import 'package:todoo/screens/add_tasks.dart';

import 'package:todoo/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskcontroller = Get.find<Taskcontroller>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled:
                  true, // We used this to make the widgets appear above the keyboard but it will stretch to the top
              context: context,
              // We will wrap our add task screen with a container and singlechildscrollview so that the
              // widgets above the keyboard not only stay above but also the bottom sheet does not strecthes itself to the top
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScreen(),
                    ),
                  ));
        },
        backgroundColor: Colors.lightGreenAccent.withOpacity(1),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.lightGreenAccent,
                  Colors.lightGreenAccent.withOpacity(0.6),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 60, right: 30, left: 30, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            radius: 30,
                            child: const Icon(
                              Icons.list,
                              size: 30,
                            )),
                        const SizedBox(height: 10),
                        const Text(
                          'Todoo',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.book),
                            const SizedBox(width: 5),
                            const Text(
                              'Total Tasks:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                '${taskcontroller.taskCount}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 70, 70, 70),
                                  fontSize: 15,
                                ),
                              );
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: const TaskList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
