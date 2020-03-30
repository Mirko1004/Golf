
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieWidget extends StatefulWidget {
  final String _videoUrl;
  final String _imageUrl;

  const ChewieWidget(this._videoUrl, this._imageUrl);

  @override
  State<StatefulWidget> createState() => _ChewieWidgetState();
}

class _ChewieWidgetState extends State<ChewieWidget>{

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {

    _calculateImageDimension(widget._imageUrl).then((aspectRatio) async {

      _videoPlayerController = VideoPlayerController.network(widget._videoUrl);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: aspectRatio,
        autoPlay: false,
        looping: false,
        // Try playing around with some of these other options:

        // showControls: false,
        // materialProgressColors: ChewieProgressColors(
        //   playedColor: Colors.red,
        //   handleColor: Colors.blue,
        //   backgroundColor: Colors.grey,
        //   bufferedColor: Colors.lightGreen,
        // ),
        // placeholder: Container(
        //   color: Colors.grey,
        // ),
        autoInitialize: true,
      );
      await _chewieController.setVolume(0);
      await _chewieController.pause();

      setState(() {

      });

    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget body;
    if(_chewieController == null )
      body = Container();
    else {
      body = Column(
        children: <Widget>[

          Padding(padding: EdgeInsets.only(top: 10.0),),

          Expanded(
            child: _chewieController != null ? SafeArea(child: Chewie( controller: _chewieController, ),) : Container(),
          ),

          Padding(padding: EdgeInsets.only(top: 10.0),)
        ],
      );
    }

    return body;
  }

  Future<double> _calculateImageDimension(String imageUrl) {
    Completer<double> completer = Completer();
    Image image = Image.network(imageUrl);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          completer.complete(myImage.width.toDouble() / myImage.height.toDouble());
        },
      ),
    );
    return completer.future;
  }

}