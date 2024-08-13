import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(MyApp());
}

// Custom Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hello Flutter",
            style: TextStyle(fontFamily: "Poppins"),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Hello Flutter App!",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: "Poppins"),
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/flutter_icon.png",
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "This app is developed by Ayush!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Image.network(
                          "https://avatars.githubusercontent.com/u/84234373?v=4",
                          height: 50),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ayush",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Flutter Developer",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "f8th.netlify.app",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
