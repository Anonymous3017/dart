import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/splash_screen.dart';

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
        content: Text("Login successful"),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);

      // Navigate to the dashboard
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      SnackBar messageSnackBar;
      if (e.code == 'user-not-found') {
        messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Email not registered."),
        );
      } else if (e.code == 'wrong-password') {
        messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Incorrect password."),
        );
      } else if (e.code == 'weak-password') {
        messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The password provided is too weak."),
        );
      } else if (e.code == 'email-already-in-use') {
        messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The account already exists for that email."),
        );
      } else {
        messageSnackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text("An unknown error occurred."),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
    } catch (e) {
      SnackBar messageSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
    }
  }
}
