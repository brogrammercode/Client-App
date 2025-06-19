// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HoverButton extends StatefulWidget {
  final String title;
  final void Function() onTap;
  const HoverButton({super.key, required this.title, required this.onTap});

  @override
  State<HoverButton> createState() => HoverButtonState();
}

class HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: isHovered ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: SelectableText(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
                  fontSize: 13,
                  color: isHovered ? Colors.black : Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
      _controller.setVolume(0); 
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  (snapshot.connectionState == ConnectionState.waiting &&
                          _controller.value.isInitialized == false)
                      ? '0%'
                      : '100%',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
