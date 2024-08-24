import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddBucketListScreen extends StatefulWidget {
  int newIndex;
  AddBucketListScreen({super.key, required this.newIndex});

  @override
  State<AddBucketListScreen> createState() => _AddBucketListScreenState();
}

class _AddBucketListScreenState extends State<AddBucketListScreen> {
  TextEditingController itemText = TextEditingController();

  TextEditingController costText = TextEditingController();

  TextEditingController imageURLText = TextEditingController();

  // Function to add data to the API
  Future<void> addData(BuildContext context) async {
    // Add Data to API using dio
    try {
      Map<String, dynamic> data = {
        "item": itemText.text,
        "cost": int.parse(costText.text),
        "image": imageURLText.text.isEmpty
            ? 'https://super-monitoring.com/blog/wp-content/uploads/2019/06/placeimg.png'
            : imageURLText.text,
        "completed": false
      };
      // Add the data
      Response response = await Dio().patch(
          'https://flutterapitest12122002-default-rtdb.firebaseio.com/bucketlist/${widget.newIndex}.json',
          data: data);
      Navigator.pop(context, true);
      print(response.data);
    } catch (e) {
      // Handle the error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bucket List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: itemText,
              decoration: const InputDecoration(
                labelText: 'Item',
              ),
            ),
            TextField(
              controller: costText,
              decoration: const InputDecoration(
                labelText: 'Cost',
              ),
            ),
            TextField(
              controller: imageURLText,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addData(context);
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
