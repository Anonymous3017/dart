import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  // For theme Switcher
  bool isDarkModeChecked = true;

  void updateTheme({required bool darkMode}) async {
    isDarkModeChecked = darkMode;

    //Obtain share4d preferences and save the theme mode
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //Save the theme mode to shared preferences
    prefs.setBool('darkMode', darkMode);
    notifyListeners();
  }

  void getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkModeChecked = prefs.getBool('darkMode') ?? true;
    notifyListeners();
  }

}
