import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 200,
            width: double.infinity,
            child: const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              launchUrl(Uri.https('f8th.netlify.app', ''));
            },
            leading: const Icon(Icons.person),
            title: const Text('About Me',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () {
              launchUrl(Uri.https('mailto:ayushgupta9592@gmail.com', ''));
            },
            leading: const Icon(Icons.email),
            title: const Text('Contact Me',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
