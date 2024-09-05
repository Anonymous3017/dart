import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<QueryDocumentSnapshot> messages;
  final String currentUserId;

  const MessageList({
    Key? key,
    required this.messages,
    required this.currentUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var message = messages[messages.length - 1 - index];
        bool isCurrentUser = message["sender_id"] == currentUserId;
        return Align(
          alignment:
              isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message["sender_name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(message["text"],
                    style: const TextStyle(
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
