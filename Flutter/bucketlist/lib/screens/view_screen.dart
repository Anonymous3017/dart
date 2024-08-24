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

  //Function for Mark as Complete
  Future<void> markAsComplete() async {
    Navigator.pop(context);
    try {
      // Mark the item as complete
      Response response = await Dio().patch(
          'https://flutterapitest12122002-default-rtdb.firebaseio.com/bucketlist/${widget.index}.json',
          data: {'completed': true});
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

  //Widget to showDilog for mark as complete and delete
  Widget markAsCompleteWidget() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Mark as complete'),
            content: const Text(
                'Are you sure you want to mark this item as complete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    // Mark the item as complete
                    markAsComplete();
                  },
                  child: const Text('Mark as complete')),
            ],
          );
        });
    return Container(); // Add a return statement here
  }

  //Widget to showDilog for delete
  Widget deleteWidget() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete item'),
            content: const Text('Are you sure you want to delete this item?'),
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
    return Container(); // Add a return statement here
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
              markAsCompleteWidget();
            } else if (value == 'delete') {
              // Delete the item
              deleteWidget();
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
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
            'Price: \$${widget.price}',
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          //Elevated button for mark as complete
          ElevatedButton(
            onPressed: markAsCompleteWidget,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[300],
            ),
            child: const Text('Mark as complete',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
