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
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<UserProvider>(context);
    return MaterialApp(
      theme: (themeProvider.isDarkModeChecked)
          ? ThemeData(
              brightness: Brightness.dark,
              useMaterial3: true,
              fontFamily: "Poppins")
          : ThemeData(
              brightness: Brightness.light,
              useMaterial3: true,
              fontFamily: "Poppins"),
      title: 'Global Chat',
      home: const SplashScreen(),
    );
  }
}
