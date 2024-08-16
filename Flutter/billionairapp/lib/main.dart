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
      theme: ThemeData.dark(),
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
                // Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        child: const Text('1'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                        child: const Text('2'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        child: const Text('3'),
                      ),
                    ),
                  ],
                ),
                // const Text('ballance part'),
                ElevatedButton(
                    onPressed: buttonClicked, child: const Text('Click here')),
              ],
            ),
          )),
    );
  }
}
