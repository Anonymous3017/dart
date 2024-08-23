import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> getData() async {
    //Get Data from API using dio
    Response response = await
    Dio()
        .get('https://flutterapitest12122002-default-rtdb.firebaseio.com/bucketlist.json');
            print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bucket List'),
      ),
      body: ElevatedButton(
        onPressed: getData,
        child: const Text('Get Data'),
      ),
    );
  }
}
