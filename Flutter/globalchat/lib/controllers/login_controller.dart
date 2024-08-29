import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashboard_screen.dart';

class LoginController {
  static Future<void> login(
      {required BuildContext context,
      required String emailController,
      required String passwordController}) async {
    // Create an account
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
      SnackBar messageSnackBar = const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Account created successfully"),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);

      // Navigate to the dashboard
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBar messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The password provided is too weak."),
        );
        ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      } else if (e.code == 'email-already-in-use') {
        SnackBar messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The account already exists for that email."),
        );
        ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      }
    } catch (e) {
      SnackBar messageSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
    }
  }
}
