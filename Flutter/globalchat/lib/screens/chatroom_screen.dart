import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/providers/user_provider.dart';
import 'package:globalchat/screens/messageList.dart';
import 'package:provider/provider.dart';

class ChatroomScreen extends StatefulWidget {
  final String chatroomName;
  final String chatroomId;

  ChatroomScreen(
      {Key? key, required this.chatroomName, required this.chatroomId})
      : super(key: key);

  @override
  State<ChatroomScreen> createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  var db = FirebaseFirestore.instance;
  TextEditingController messageText = TextEditingController();

  Future<void> sendMessage() async {
    //validation
    if (messageText.text.isEmpty) {
      return;
    }
    // send message to chatroom
    Map<String, dynamic> messageToSend = {
      "text": messageText.text,
      "sender_name": Provider.of<UserProvider>(context, listen: false).userName,
      "sender_id": Provider.of<UserProvider>(context, listen: false).userId,
      "chatroom_id": widget.chatroomId,
      "timestamp": FieldValue.serverTimestamp()
    };

    // save message to firestore
    try {
      await db.collection("messages").add(messageToSend);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId =
        Provider.of<UserProvider>(context, listen: false).userId;
    var themeProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatroomName),
      ),
      body: Center(
        // chatroomid in text
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: db
                    .collection("messages")
                    .where("chatroom_id", isEqualTo: widget.chatroomId)
                    .orderBy("timestamp", descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  print('Connection State: ${snapshot.connectionState}');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    print(
                        'No messages found for chatroom: ${widget.chatroomId}');
                    return const Center(
                      child: Text('No messages found.'),
                    );
                  } else {
                    print('Messages loaded: ${snapshot.data!.docs.length}');
                    return MessageList(
                      messages: snapshot.data!.docs,
                      currentUserId: currentUserId,
                    );
                  }
                },
              ),
            ),
            Container(
              color:
                  // if dark mode is enabled, set the color to black12, else set it to grey[200]
                  (themeProvider.isDarkModeChecked)
                      ? Colors.black12
                      : Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(
                          color:
                              // if dark mode is enabled, set the color to white, else set it to black
                              (themeProvider.isDarkModeChecked)
                                  ? Colors.white
                                  : Colors.black),
                      controller: messageText,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Type a message"),
                    )),
                    InkWell(
                      child: const Icon(Icons.send),
                      onTap: () {
                        sendMessage();
                        messageText.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
