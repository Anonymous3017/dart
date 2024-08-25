import 'package:flutter/material.dart';
import 'package:globalchat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Chat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Global Chat'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}