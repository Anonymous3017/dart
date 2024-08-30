import 'package:flutter/material.dart';
import 'package:globalchat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:globalchat/providers/user_provider.dart';
import 'package:globalchat/screens/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      child: MyApp(), create: (context) => UserProvider()));
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
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: "Poppins"),
      title: 'Global Chat',
      home: SplashScreen(),
    );
  }
}
