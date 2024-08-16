import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0.0;

  void addMoney() async {
    // Update the UI
    setState(() {
      balance = balance + 500;
    });

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an double value to 'decimal' key.
    await prefs.setDouble('balance', balance);
    print(balance);
  }

  void loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? savedBalance = prefs.getDouble('balance');
    if (savedBalance != null) {
      setState(() {
        balance = savedBalance;
      });
    }
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
                      OutlinedButton(
                          onPressed: loadBalance,
                          child: const Text('Load Balance')),
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
