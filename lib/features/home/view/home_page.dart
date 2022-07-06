import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:websocket_video_stream/features/video_detail/view/video_detail_view.dart';
import 'package:websocket_video_stream/product/mocks/video_mock_datas.dart';
import 'package:websocket_video_stream/video_streaming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.2, 0.9, 1],
                      ),
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/poster.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Crime",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white, fontSize: 15),
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.grey,
                      ),
                      Text(
                        "Drama",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.add),
                            Text(
                              "My List",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoStream(
                                      videoPlayerController:
                                          VideoPlayerController.network(
                                              VideoMockDatas.videos[0]
                                                  ['videoUrl']),
                                      isLive: false),
                                ),
                              );
                            },
                            child: Row(
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
                        Column(
                          children: [
                            const Icon(Icons.info_outline),
                            Text(
                              "Info",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Text(
                      "Today's Top 10 series list",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 130,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/$index.jpeg"),
                                                    fit: BoxFit.cover,
                                                    scale: 10),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Text(
                                                        "Avatar",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(Icons
                                                            .close_outlined))
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Text(
                                                    "2022  16+  3 Season",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        ?.copyWith(
                                                            color: Colors.grey,
                                                            fontSize: 12),
                                                  ),
                                                ),
                                                Text(
                                                  "At occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      ?.copyWith(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VideoStream(
                                                  videoPlayerController:
                                                      VideoPlayerController
                                                          .network(
                                                              VideoMockDatas
                                                                      .videos[1]
                                                                  ['videoUrl']),
                                                  isLive: false),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
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
                                                  ?.copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
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
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
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
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
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
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder:
                                                (context) => VideoDetailPage(
                                                      videoPlayerController:
                                                          VideoPlayerController
                                                              .network(VideoMockDatas
                                                                      .videos[1]
                                                                  ['videoUrl']),
                                                    )),
                                      );
                                    },
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                    leading: Icon(Icons.info_outline),
                                    title: Text(
                                      "Edisodes and More",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 150,
                            margin: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/$index.jpeg"),
                                  fit: BoxFit.cover,
                                  scale: 10),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            right: 85,
                            child: Stack(
                              children: [
                                // The text border
                                Text(
                                  '${(index + 1)}',
                                  style: TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.5
                                      ..color = Colors.grey,
                                  ),
                                ),
                                // The text inside
                                Text(
                                  '${(index + 1)}',
                                  style: const TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF171717),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Text(
                      "Month's Top 10 series list",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 130,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/${index + 4}.jpeg"),
                                                    fit: BoxFit.cover,
                                                    scale: 10),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Text(
                                                        "Avatar",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(Icons
                                                            .close_outlined))
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Text(
                                                    "2022  16+  3 Episode",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        ?.copyWith(
                                                            color: Colors.grey,
                                                            fontSize: 12),
                                                  ),
                                                ),
                                                Text(
                                                  "At occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      ?.copyWith(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VideoStream(
                                                  videoPlayerController:
                                                      VideoPlayerController
                                                          .network(
                                                              VideoMockDatas
                                                                      .videos[1]
                                                                  ['videoUrl']),
                                                  isLive: false),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
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
                                                  ?.copyWith(
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
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
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
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
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
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
                                                ?.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder:
                                                (context) => VideoDetailPage(
                                                      videoPlayerController:
                                                          VideoPlayerController
                                                              .network(VideoMockDatas
                                                                      .videos[1]
                                                                  ['videoUrl']),
                                                    )),
                                      );
                                    },
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                    leading: Icon(Icons.info_outline),
                                    title: Text(
                                      "Edisodes and More",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 150,
                            margin: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/${index + 4}.jpeg"),
                                  fit: BoxFit.cover,
                                  scale: 10),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            right: 85,
                            child: Stack(
                              children: [
                                // The text border
                                Text(
                                  '${(index + 1)}',
                                  style: TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.5
                                      ..color = Colors.grey,
                                  ),
                                ),
                                // The text inside
                                Text(
                                  '${(index + 1)}',
                                  style: const TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF171717),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Text(
                      "Best movies list",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: 110,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/${index + 4}.jpeg"),
                              fit: BoxFit.cover,
                              scale: 10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
