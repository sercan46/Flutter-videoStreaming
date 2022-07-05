import 'package:flutter/material.dart';
import 'package:websocket_video_stream/video_streaming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List videos = [
    {
      "id": 0,
      "title": "Report-1",
      "videoUrl":
          "https://playout4multirtmp.tulix.tv/live36/Stream1/playlist.m3u8"
    },
    {
      "id": 1,
      "title": "Cartoon",
      "videoUrl": "https://bozztv.com/1gbw5/polonico/polonico/playlist.m3u8"
    },
    {
      "id": 2,
      "title": "Report-2",
      "videoUrl":
          "https://bozztv.com/playout6multi/output75/output75.stream/playlist.m3u8"
    },
    {
      "id": 3,
      "title": "Cartoon-2",
      "videoUrl":
          "http://ffetv.tulix.tv/iframe.php?vt=tulix&fn=Julius-Playout-overview11.mp4 "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemExtent: 100.0,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoStream(
                              videoUrl: videos[index]['videoUrl'],
                            ),
                          ),
                        );
                      },
                      leading: const Icon(
                        Icons.video_collection,
                        color: Colors.blue,
                      ),
                      title: Text(
                        videos[index]['title'],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(Icons.navigate_next_rounded),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
