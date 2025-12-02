import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StreamVideoPlayer extends StatefulWidget {
  const StreamVideoPlayer({super.key});

  @override
  State<StreamVideoPlayer> createState() => _StreamVideoPlayerState();
}

class _StreamVideoPlayerState extends State<StreamVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  bool _initialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse("http://10.175.2.73:3000/file/stream-video"))
      ..initialize().then(
        (value) {
          setState(() {
            _initialized = true;
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Center(
        child: Container(
            child: _initialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController))
                : CircularProgressIndicator()),
      ),
    );
  }
}
