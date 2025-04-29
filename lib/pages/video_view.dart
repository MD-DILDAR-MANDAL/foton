import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  VideoView({super.key, required this.aEntity});
  final AssetEntity aEntity;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final VideoPlayerController _videoController;
  late final ChewieController _chewieController;
  late final Chewie videoPlayerWidget;
  bool initialized = false;

  _initVideo() async {
    File? video = await widget.aEntity.file;
    _videoController = VideoPlayerController.file(video!)..setLooping(true);
    await _videoController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      looping: true,
    );

    videoPlayerWidget = Chewie(controller: _chewieController);
    if (mounted) {
      setState(() => initialized = true);
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Foton'),
        foregroundColor: Color(0xFFFDDCC8),
        backgroundColor: Color(0xFF000000),
      ),
      body:
          initialized
              ? Center(
                child: AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: videoPlayerWidget,
                ),
              )
              : CircularProgressIndicator(),
    );
  }
}
