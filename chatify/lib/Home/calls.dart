import 'package:chatify/constants/appColors.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: const Center(
          child: Text(
        'Calls screen',
        style: TextStyle(color: AppColors.secondaryColor),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        onPressed: () {},
        child: const Icon(Icons.call),
      ),
    );
  }
}
