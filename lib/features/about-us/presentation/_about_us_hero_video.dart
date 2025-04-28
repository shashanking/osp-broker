import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AboutUsHeroVideo extends StatefulWidget {
  const AboutUsHeroVideo({super.key});

  @override
  State<AboutUsHeroVideo> createState() => _AboutUsHeroVideoState();
}

class _AboutUsHeroVideoState extends State<AboutUsHeroVideo> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/about-us-banner.mp4')
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
          _controller.setLooping(true);
          _controller.setVolume(0);
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? SizedBox.expand(child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ))
        : Container(color: Colors.black);
  }
}
