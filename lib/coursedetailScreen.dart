import 'package:flutter/material.dart';
import 'package:video_player/videoListView.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailScreen extends StatefulWidget {
  final String title;
  final String imagePath;

  const CourseDetailScreen(
      {super.key, required this.title, required this.imagePath});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late YoutubePlayerController YoutubeController;

  List<String> playlist = [
    'ZCu9RCaLpMs',
    '2Cjhz9FVz0U',
    '80l3gAJlTs8',
    '80l3gAJlTs8',
    'ZCu9RCaLpMs'
  ];

  final List<Video> videos = [
    Video(
        thumbnailUrl: "assets/images/flutter.png",
        title: "flutter",
        description: "abcd"),
    Video(
        thumbnailUrl: "assets/images/flutter.png",
        title: "flutter",
        description: "abcd"),
    Video(
        thumbnailUrl: "assets/images/flutter.png",
        title: "flutter",
        description: "abcd"),
    Video(
        thumbnailUrl: "assets/images/flutter.png",
        title: "flutter",
        description: "abcd"),
    Video(
        thumbnailUrl: "assets/images/flutter.png",
        title: "flutter",
        description: "abcd"),
  ];

  @override
  void initState() {
    super.initState();
    YoutubeController = YoutubePlayerController(
        initialVideoId: playlist[0],
        flags: YoutubePlayerFlags(autoPlay: false, mute: false));
  }

  @override
  void dispose() {
    super.dispose();
    YoutubeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Videos'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            YoutubePlayer(
              controller: YoutubeController,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                      playedColor: Colors.green, handleColor: Colors.green),
                ),
                PlaybackSpeedButton(),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return VideoListView(
                    video: videos[index],
                    onVideoTap: () {
                      YoutubeController.load(playlist[index]);
                      YoutubeController.play();
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
