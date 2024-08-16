import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  final void Function() addMoneyFunction;

  const AddMoneyButton({super.key, required this.addMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size(double.infinity, 0),
        ),
        onPressed: addMoneyFunction,
        child: const Text('Add 500\$ Billion'),
      ),
    );
  }
}
