import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/providers/user_provider.dart';
import 'package:globalchat/screens/chatroom_screen.dart';
import 'package:globalchat/screens/profile_screen.dart';
import 'package:globalchat/screens/settings_screen.dart';
import 'package:globalchat/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardStateScreen();
}

class _DashboardStateScreen extends State<DashboardScreen> {
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> chatroomsList = [];
  List<String> chatroomIds = [];

  void getChatrooms() async {
    //get chatrooms
    await db.collection("chatrooms").get().then((dataSnapshot) {
      for (var singleChatroomData in dataSnapshot.docs) {
        chatroomsList.add(singleChatroomData.data());
        chatroomIds.add(singleChatroomData.id.toString());
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getChatrooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("Dev Chat"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: CircleAvatar(
                child: Text(userProvider.userName[0]),
              ),
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    userProvider.userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(userProvider.userEmail),
                  leading: CircleAvatar(
                    child: Text(userProvider.userName[0]),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                ),
                ListTile(
                  title: const Text("Settings"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()));
                  },
                ),
                //logout
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.logout),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: chatroomsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatroomScreen(
                              chatroomName:
                                  chatroomsList[index]["chatroom_name"] ?? "",
                              chatroomId: chatroomIds[index])));
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey[900],
                  child: Text(chatroomsList[index]["chatroom_name"]![0],
                      style: TextStyle(color: Colors.white)),
                ),
                title: Text(chatroomsList[index]["chatroom_name"] ?? ""),
                subtitle: Text(chatroomsList[index]["desc"] ?? ""),
              );
            }));
  }
}
