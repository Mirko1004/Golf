import 'dart:io';

import 'package:flutter/material.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/video_player/video_player_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {

  final String _videoUrl;

  VideoWidget(this._videoUrl);

  @override
  _VideoWidgetState createState() => _VideoWidgetState(_videoUrl);
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;

  final VideoWidgetBloc _videoWidgetBloc;

  _VideoWidgetState(String videoUrl) : _videoWidgetBloc = VideoWidgetBloc(videoUrl);

  _initVideoController(File file) {
    if(_controller != null)
      return;
    _controller = VideoPlayerController.file(file)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDetailAppBar(context, 'VIDEO'),


      body: getLayout(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          Icons.play_arrow,
//          _controller?.value?.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  getLayout() {
    return StreamBuilder<File>(
      initialData: null,
      stream: _videoWidgetBloc.videoFile,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot == null || snapshot.data == null)
          return Container();
        else {
          _initVideoController(snapshot.data);
          return new Center(
            child: _controller.value.initialized ?
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ) :
            Container(),
          );
        }
      },
    );
  }
}