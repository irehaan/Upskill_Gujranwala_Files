import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String Task_title;

  final void Function(bool?) CheckboxCallBack;

  final VoidCallback longPressCallback;

  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.Task_title,
      required this.CheckboxCallBack,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
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
