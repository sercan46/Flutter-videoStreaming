import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStream extends StatefulWidget {
  final String? videoUrl;

  const VideoStream({Key? key, this.videoUrl}) : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  VideoPlayerController? _videoPlayerController;
  FlickManager? flickManager;

  bool? isLoadingDataComplete = false;
  bool? openSound = true;
  @override
  void initState() {
    super.initState();
    isLoadingDataComplete = true;

    _videoPlayerController = VideoPlayerController.network(widget.videoUrl!)
      ..initialize().then((_) {
        setState(() {
          isLoadingDataComplete = true;
        });
      }).catchError((err) {
        print(err);
        setState(() {
          isLoadingDataComplete = true;
        });
      });
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.videoUrl!),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flickManager?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streaming Video'),
      ),
      body: isLoadingDataComplete == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlickVideoPlayer(flickManager: flickManager!),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
