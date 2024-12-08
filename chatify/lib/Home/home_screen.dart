import 'package:chatify/Home/calls.dart';
import 'package:chatify/Home/status.dart';
import 'package:chatify/constants/appColors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              automaticallyImplyLeading: false,
              title: const Text(
                'Chatify',
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    letterSpacing: 1.5,
                    fontSize: 25,
                    fontFamily: 'Pacifico'),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.secondaryColor,
                    )),
                IconButton(
                    onPressed: () {
                      // Get.to(ChatScreen);
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.secondaryColor,
                    )),
              ],
              bottom: TabBar(
                labelColor: Colors.lightGreenAccent.withOpacity(0.8),
                unselectedLabelColor: AppColors.secondaryColor,
                indicatorWeight: 3,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'CHATS'),
                  Tab(text: 'STATUS'),
                  Tab(text: 'CALLS'),
                ],
              ),
            ),
            body: const TabBarView(children: [
              // ChatScreen(),
              StatusScreen(),
              CallScreen(),
            ])));
  }
}
