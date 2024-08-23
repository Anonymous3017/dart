import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ViewItemScreen extends StatefulWidget {
  // String title is for the title of the item
  final String title;
  // String imageUrl is for the image of the item
  final String imageUrl;
  // int price is for the price of the item
  final int price;
  // int index is for the index of the item
  final int index;
  // Function getData is for getting the data
  // final Function getData;

  const ViewItemScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.index,
    // required this.getData
  });

  @override
  State<ViewItemScreen> createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  // Function to delete the data
  Future<void> deleteData() async {
    Navigator.pop(context);
    try {
      // Delete the item
      Response response = await Dio().delete(
          'https://flutterapitest12122002-default-rtdb.firebaseio.com/bucketlist/${widget.index}.json');
      print(response.data);
      Navigator.pop(context, true);
      setState(() {
        // Update the UI
        // widget.getData();
      });
    } catch (e) {
      // Handle the error
      print(e);
    }
  }

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
                              deleteData();
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
          Text(widget.index.toString()),
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
          Text('Price: \$${widget.price}'),
        ],
      ),
    );
  }
}
