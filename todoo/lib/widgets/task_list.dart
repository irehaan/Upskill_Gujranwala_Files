import 'package:flutter/material.dart';
import 'package:todoo/widgets/task_tile.dart';

class tasklist extends StatelessWidget {
  const tasklist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      SizedBox(height: 10),
      TaskTile(),
      TaskTile(),
      TaskTile(),
      TaskTile(),
    ]);
  }
}
