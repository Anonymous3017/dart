import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0.0;

  void addMoney() {
    balance += 500;

    // Update the UI
    setState(() {
      balance = balance;
    });

    print(balance);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billionaire App!',
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
          appBar:
              AppBar(title: const Text('Billionaire App!'), centerTitle: true),
          body: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey[700],
            height: double.infinity,
            width: double.infinity,

            // Column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('ballance part'),
                      const SizedBox(height: 20),
                      Text('$balance'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          minimumSize: const Size(double.infinity, 0)),
                      onPressed: addMoney,
                      child: const Text('Add 500\$ Billion')),
                ),
              ],
            ),
          )),
    );
  }
}
