import 'package:flutter/material.dart';

class VideoListView extends StatelessWidget {
  final Video video;
  final VoidCallback onVideoTap;

  VideoListView({super.key, required this.video, required this.onVideoTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        leading: Container(
          height: 100,
          width: 100,
          child: Image.asset(
            video.thumbnailUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          video.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          video.description,
          style: TextStyle(fontSize: 18),
        ),
        onTap: onVideoTap,
      ),
    );
  }
}

class Video {
  final String thumbnailUrl;
  final String title;
  final String description;

  Video({
    required this.thumbnailUrl,
    required this.title,
    required this.description,
  });
}
