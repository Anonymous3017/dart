import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globalchat/screens/dashboard_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> createAccount() async {
    // Create an account
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: Form(
        key: userFormKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Signup form
              const Text("Signup Screen"),
              const SizedBox(height: 23),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Email";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your email",
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 23),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Password";
                  }
                  return null;
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Signup logic
                  if (userFormKey.currentState!.validate()) {
                    // Create an account
                    createAccount();
                  }
                },
                child: const Text("Create an Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
