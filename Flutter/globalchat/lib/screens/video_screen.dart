import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globalchat/widgets/bottom_nav.dart';
import 'package:globalchat/widgets/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> videoUrls = [];
  bool isLoading = false;

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      print('Fetching data...');
      final response = await Dio().get(
          'https://raw.githubusercontent.com/Anonymous3017/dart/master/Flutter/flutter_dummy_api/videos.json');
      final data = jsonDecode(response.data);

      setState(() {
        videoUrls = List<String>.from(data);
        isLoading = false;
      });
      print('Video URLs: $videoUrls');
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : videoUrls.isEmpty
              ? const Center(
                  child: Text('No videos available'),
                )
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: videoUrls.length,
                  itemBuilder: (context, index) {
                    return VideoPlayerWidget(
                      videoUrl: videoUrls[index],
                    );
                  },
                ),
      bottomNavigationBar: const BottomNav(
        selectedIndexNo: 1,
      ),
    );
  }
}
