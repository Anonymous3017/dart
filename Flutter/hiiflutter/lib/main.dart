import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hiiflutter/child_one.dart';
import 'package:hiiflutter/child_three.dart';
import 'package:hiiflutter/child_two.dart';

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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChildOne(),
              ChildTwo(),
              ChildThree(),
            ],
          ),
        ),
      ),
    );
  }
}
