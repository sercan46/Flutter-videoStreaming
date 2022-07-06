import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  const VideoDetailPage({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
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
      isLive: false,
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Avatar",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "2022",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white24,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        "16+",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "4 Season",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        "HD",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.redAccent,
              ),
              title: Text(
                "Number 1 In The Series Today",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => VideoStream(
                  //         videoPlayerController:
                  //             VideoPlayerController.network(
                  //                 VideoMockDatas.videos[0]
                  //                     ['videoUrl']),
                  //         isLive: false),
                  //   ),
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Play",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => VideoStream(
                  //         videoPlayerController:
                  //             VideoPlayerController.network(
                  //                 VideoMockDatas.videos[0]
                  //                     ['videoUrl']),
                  //         isLive: false),
                  //   ),
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Download : S1:E1",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "At occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white, fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => VideoStream(
                    //         videoPlayerController:
                    //             VideoPlayerController
                    //                 .network(
                    //                     VideoMockDatas
                    //                             .videos[1]
                    //                         ['videoUrl']),
                    //         isLive: false),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Icons.play_circle,
                          size: 30,
                        ),
                      ),
                      Text(
                        "Play",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.download,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Download",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                    Text(
                      "My List",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.share,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Share",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
