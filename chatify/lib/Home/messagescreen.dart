import 'package:chatify/Home/chatmessage.dart';
import 'package:chatify/Home/message.box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightGreenAccent.withOpacity(0.8),
            ),
          );
        }
        final messages = snapshot.data!.docs;
        List<Messagebox> messageBox = messages.map((message) {
          final data = message.data() as Map<String, dynamic>;
          final messageText = data['text'] ?? '';
          final messageSender = data['sender'] ?? '';
          final currentUser = loggedInUser?.email;

          return Messagebox(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
        }).toList();

        return Expanded(
          child: ListView.builder(
            reverse: true,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            itemCount: messageBox.length,
            itemBuilder: (context, index) => messageBox[index],
          ),
        );
      },
    );
  }
}
