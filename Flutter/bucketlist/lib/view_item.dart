import 'package:flutter/material.dart';

class ViewItemScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int price;
  const ViewItemScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price});

  @override
  State<ViewItemScreen> createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
