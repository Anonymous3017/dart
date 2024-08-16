import 'package:flutter/material.dart';

class BalanceView extends StatelessWidget {
  final double balance;
  const BalanceView({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('ballance part'),
          const SizedBox(height: 20),
          Text('$balance'),
        ],
      ),
    );
  }
}
