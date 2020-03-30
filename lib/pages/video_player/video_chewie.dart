import 'package:flutter/material.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/video_player/cheview_widget.dart';

class ChewieDemo extends StatefulWidget {

  final String _videoUrl;
  final String _imageUrl;

  ChewieDemo(this._videoUrl, this._imageUrl);

  @override
  State<StatefulWidget> createState() => _ChewieDemoState();
}

class _ChewieDemoState extends State<ChewieDemo> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getDetailAppBar(context, 'VIDEO'),
      body: ChewieWidget(widget._videoUrl, widget._imageUrl),
    );
  }
}