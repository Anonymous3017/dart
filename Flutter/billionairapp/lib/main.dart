import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void buttonClicked() {
    print('Button clicked');
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
                const Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ballance part'),
                      SizedBox(height: 20),
                      Text('0'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          minimumSize: const Size(double.infinity, 0)),
                      onPressed: buttonClicked,
                      child: const Text('Add 1 Billion')),
                ),
              ],
            ),
          )),
    );
  }
}
