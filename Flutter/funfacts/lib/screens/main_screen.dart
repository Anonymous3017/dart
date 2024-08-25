import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funfacts/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];
  bool isLoading = false;

  //api url: https://raw.githubusercontent.com/Anonymous3017/dart/master/Flutter/flutter_dummy_api/facts.json

  void getData() async {
    try {
      isLoading = true;
      final response = await Dio().get(
          'https://raw.githubusercontent.com/Anonymous3017/dart/master/Flutter/flutter_dummy_api/facts.json');
      final data = jsonDecode(response.data);
      setState(() {
        facts = data;
        isLoading = false;
      });
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Facts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: facts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              facts[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Swipe up for more facts',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
