import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hiiflutter/container_widget.dart';

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
        body: const ContainerWidget(),
      ),
    );
  }
}
