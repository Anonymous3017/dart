import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/providers/user_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var db = FirebaseFirestore.instance;

  TextEditingController nameText = TextEditingController();

  var editProfileFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    nameText.text = Provider.of<UserProvider>(context, listen: false).userName;
    super.initState();
  }

  void updateData() {
    Map<String, dynamic> dataToUpdate = {
      "name": nameText.text,
    };
    db
        .collection("users")
        .doc(Provider.of<UserProvider>(context, listen: false).userId)
        .update(dataToUpdate);

    Provider.of<UserProvider>(context, listen: false).getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          InkWell(
            onTap: () {
              //update the user name
              if (editProfileFormKey.currentState!.validate()) {
                updateData();
                Navigator.pop(context, true);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: editProfileFormKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                  controller: nameText,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
