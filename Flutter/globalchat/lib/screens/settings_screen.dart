import 'package:flutter/material.dart';
import 'package:globalchat/widgets/bottom_nav.dart';
import 'package:globalchat/widgets/theme_switcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Column(
        children: [
          ThemeSwitcher(),
        ],
      ),
      bottomNavigationBar: const BottomNav(
        selectedIndexNo: 2,
      ),
    );
  }
}
