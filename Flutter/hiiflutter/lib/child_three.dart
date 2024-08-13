import 'package:flutter/material.dart';

class ChildThree extends StatelessWidget {
  const ChildThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Image.network(
                "https://avatars.githubusercontent.com/u/84234373?v=4",
                height: 50),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ayush",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Flutter Developer",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "f8th.netlify.app",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ));
  }
}
