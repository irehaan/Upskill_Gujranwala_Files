import 'package:flutter/material.dart';

class tasktile extends StatefulWidget {
  const tasktile({super.key});

  @override
  State<tasktile> createState() => _tasktileState();
}

class _tasktileState extends State<tasktile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is just a simple task',
        style: TextStyle(
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: taskcheckbox(isChecked),
    );
  }
}

class taskcheckbox extends StatelessWidget {
  final bool CheckboxState;

  const taskcheckbox(this.CheckboxState, {super.key});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.black,
        value: CheckboxState,
        onChanged: (newValue) {
          // setState(() {
          //   isChecked = newValue!;
          // });
        });
  }
}
