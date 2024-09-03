import 'package:flutter/material.dart';
import 'package:globalchat/controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
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
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter your name",
                          labelText: "Name",
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: country,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Country";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter your country",
                          labelText: "Country",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 50),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 63, 5, 10),
                              ),
                              onPressed: () async {
                                // signup logic
                                isLoading = true;
                                setState(() {});
                                if (userFormKey.currentState!.validate()) {
                                  // Signup an account
                                  await SignupController.createAccount(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: name.text,
                                    country: country.text,
                                  );
                                  isLoading = false;
                                  setState(() {});
                                }
                              },
                              child: isLoading
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("Sign Up"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
