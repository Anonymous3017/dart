import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashboard_screen.dart';
import 'package:globalchat/screens/profile_screen.dart';
import 'package:globalchat/screens/settings_screen.dart';
import 'package:globalchat/screens/video_screen.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndexNo;
  const BottomNav({super.key, required this.selectedIndexNo});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      animationDuration: const Duration(seconds: 1),
      selectedIndex: widget.selectedIndexNo,
      onDestinationSelected: (index) {
        if (index == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        } else if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()));
        } else if (index == 1) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const VideoScreen()),
              (route) => false);
        } else if (index == 0) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (route) => false);
        }
      },
      destinations: _navBarItems,
    );
  }
}

const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.chat_outlined),
    selectedIcon: Icon(Icons.chat_rounded),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.smart_display_outlined),
    selectedIcon: Icon(Icons.smart_display_rounded),
    label: 'Status',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
  NavigationDestination(
    icon: Icon(Icons.person_outline_rounded),
    selectedIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];
