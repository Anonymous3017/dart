import 'package:bucketlist/add_bucket_list.dart';
import 'package:bucketlist/view_item.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> bucketListData = [];
  bool isLoading = false;
  bool isError = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });
    //Get Data from API using dio
    try {
      Response response = await Dio().get(
          'https://flutterapitest12122002-default-rtdb.firebaseio.com/bucketlist.json');
      setState(() {
        bucketListData = response.data ?? [];
        isLoading = false;
        isError = false;
      });
      print(response.data);
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  // Widget to show an error message
  Widget errorWidget({required String errorMessage}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning),
          Text(errorMessage),
          ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('Retry'))
        ],
      ),
    );
  }

  // Widget to show the list of data fetched from the API
  Widget ListDataWidget() {
    return ListView.builder(
        itemCount: bucketListData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              // Navigate to the ViewItemScreen when the ListTile is tapped
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewItemScreen(
                    title: bucketListData[index]['item'] ?? '',
                    price: bucketListData[index]['cost'],
                    imageUrl: bucketListData[index]['image'],
                  );
                }));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(bucketListData[index]['image']),
              ),
              title: Text(bucketListData[index]['item'] ?? ''),
              trailing: Text(bucketListData[index]['cost'].toString()),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddBucketListScreen();
          }));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Bucket List'),
        actions: [
          InkWell(
              onTap: getData,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.refresh),
              ))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: (isLoading)
            ?
            // Show a loading indicator while fetching data
            const Center(
                child: CircularProgressIndicator(),
              )
            :
            // Check if there is an error while fetching data
            (isError)
                ?
                // Show an error message if there is an error
                errorWidget(errorMessage: 'An error occurred')
                : (bucketListData.isEmpty)
                    ?
                    // Show a message if there is no data
                    const Center(
                        child: Text('No data found'),
                      )
                    :
                    // Show the list of data if there is no error
                    ListDataWidget(),
      ),
    );
  }
}
