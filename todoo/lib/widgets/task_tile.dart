import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String Task_title;

  final void Function(bool?) CheckboxCallBack;

  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.Task_title,
      required this.CheckboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        Task_title,
        style: TextStyle(
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: Colors.black,
          value: isChecked,
          onChanged: CheckboxCallBack),
    );
  }
}
