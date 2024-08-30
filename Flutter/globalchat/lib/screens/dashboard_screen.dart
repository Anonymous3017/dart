import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/profile_screen.dart';
import 'package:globalchat/screens/splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardStateScreen();
}

class _DashboardStateScreen extends State<DashboardScreen> {
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> chatroomsList = [];

  void getChatrooms() async {
    //get chatrooms
    await db.collection("chatrooms").get().then((dataSnapshot) {
      dataSnapshot.docs.forEach((singleChatroomData) {
        chatroomsList.add(singleChatroomData.data());
      });
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dev Chat"),
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
                  title: const Text("Profile"),
                  leading: const Icon(Icons.person),
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
                    Navigator.pop(context);
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
                leading: CircleAvatar(
                  child: Text(chatroomsList[index]["chatroom_name"]![0]),
                ),
                title: Text(chatroomsList[index]["chatroom_name"] ?? ""),
                subtitle: Text(chatroomsList[index]["desc"] ?? ""),
              );
            }));
  }
}
