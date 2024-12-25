import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  bool showIcone = true;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("assets/video5814695491769734279.mp4")
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("video player"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _controller.value.isInitialized
              ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                            child: AspectRatio(
                          aspectRatio: 6 / 9,
                          child: VideoPlayer(_controller),
                        )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                                showIcone = false;
                              });
                            },
                            icon: showIcone
                                ? Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : Container())
                      ],
                    );
                  })
              : Center(child: CircularProgressIndicator())),
    );
  }
}
