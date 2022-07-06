import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStream extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isLive;
  const VideoStream(
      {Key? key, required this.videoPlayerController, required this.isLive})
      : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  late final ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () => debugPrint('Option 1 works!'),
            iconData: Icons.chat,
            title: 'Option 1',
          ),
          OptionItem(
            onTap: () => debugPrint('Option 2 working!'),
            iconData: Icons.chat,
            title: 'Option 2',
          ),
        ];
      },
      useRootNavigator: true,
      optionsBuilder: (context, defaultOptions) async {
        await showDialog<void>(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: SizedBox(
                height: 400,
                width: 300,
                child: ListView.builder(
                  itemCount: defaultOptions.length,
                  itemBuilder: (_, i) => ActionChip(
                    label: Text(defaultOptions[i].title),
                    onPressed: () => defaultOptions[i].onTap!(),
                  ),
                ),
              ),
            );
          },
        );
      },

      subtitle: Subtitles([
        Subtitle(
          index: 0,
          start: Duration.zero,
          end: const Duration(seconds: 10),
          text: 'Hello from subtitles',
        ),
        Subtitle(
          index: 1,
          start: const Duration(seconds: 10),
          end: const Duration(seconds: 20),
          text: 'Whats up? :)',
        ),
      ]),
      isLive: widget.isLive,
      subtitleBuilder: (context, subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          subtitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      startAt: const Duration(seconds: 1),
      hideControlsTimer: const Duration(seconds: 3),
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      autoPlay: true,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
