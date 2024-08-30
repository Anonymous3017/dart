import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData = {};

  var db = FirebaseFirestore.instance;

  void getData() async {
    var authUser = FirebaseAuth.instance.currentUser;
    var dataSnapshot = await db.collection("users").doc(authUser!.uid).get();
    setState(() {
      userData = dataSnapshot.data();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userData?["name"] ?? ""),
            Text(userData?["country"] ?? ""),
            Text(userData?["email"] ?? ""),
          ],
        ),
      ),
    );
  }
}
