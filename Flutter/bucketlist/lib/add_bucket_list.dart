import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddBucketListScreen extends StatefulWidget {
  int newIndex;
  AddBucketListScreen({super.key, required this.newIndex});

  @override
  State<AddBucketListScreen> createState() => _AddBucketListScreenState();
}

class _AddBucketListScreenState extends State<AddBucketListScreen> {
  // Function to add data to the API
  Future<void> addData(BuildContext context) async {
    // Add Data to API using dio
    try {
      Map<String, dynamic> data = {
        "item": "Visit Nepal",
        "cost": 10000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJOK-1spybg1oUFQ_aLDNE_umf10ZngjJ8Qg&s",
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
      body: ElevatedButton(
        onPressed: () => addData(context),
        child: const Text('Add Bucket List'),
      ),
    );
  }
}
