import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globalchat/controllers/login_controller.dart';
import 'package:globalchat/controllers/signup_controller.dart';
import 'package:globalchat/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: userFormKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Signup form
              const Text("Login Screen"),
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
                  // login logic
                  if (userFormKey.currentState!.validate()) {
                    // Login an account
                    LoginController.login(
                      context: context,
                      emailController: emailController.text,
                      passwordController: passwordController.text,
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
