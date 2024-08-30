import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String userName = "";
  String userEmail = "";
  String userId = "";

  var db = FirebaseFirestore.instance;
  Map<String, dynamic>? userData = {};
  void getUserDetails() async {
    var authUser = FirebaseAuth.instance.currentUser;
    var dataSnapshot = await db.collection("users").doc(authUser!.uid).get();

    userName = dataSnapshot.data()?["name"] ?? "";
    userEmail = dataSnapshot.data()?["email"] ?? "";
    userId = dataSnapshot.data()?["id"] ?? "";

    notifyListeners();
  }
}
