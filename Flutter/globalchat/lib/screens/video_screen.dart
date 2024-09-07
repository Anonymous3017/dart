import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globalchat/widgets/bottom_nav.dart';
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
      print('Response received: ${response.data}');
      final data = jsonDecode(response.data);
      print('Parsed data: $data');

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

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl, Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    print('Initializing VideoPlayerController for URL: ${widget.videoUrl}');
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        print('VideoPlayerController initialized');
        _initializeChewieController();
      });
  }

  void _initializeChewieController() {
    final videoRatio = _controller.value.aspectRatio;
    final screenSize = MediaQuery.of(context).size;
    final screenRatio = screenSize.width / screenSize.height;

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      showControls: false,
      // aspectRatio: videoRatio < screenRatio ? screenRatio : videoRatio,
      aspectRatio: screenRatio,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
    );
    print('ChewieController initialized');
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: _controller.value.isInitialized
          ? Chewie(
              controller: _chewieController!,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
