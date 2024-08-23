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
        actions: [
          PopupMenuButton(onSelected: (value) {
            if (value == 'complete') {
              // Mark the item as complete
            } else if (value == 'delete') {
              // Delete the item
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete item'),
                      content: const Text(
                          'Are you sure you want to delete this item?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              // Delete the item
                              Navigator.pop(context);
                            },
                            child: const Text('Delete')),
                      ],
                    );
                  });
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'complete',
                child: Text('Mark as complete'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ];
          })
        ],
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
