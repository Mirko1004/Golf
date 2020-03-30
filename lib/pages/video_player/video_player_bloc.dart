import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:golf/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class VideoWidgetBloc extends BaseBloc {

  final String _videoUrl;
  final BehaviorSubject<File> videoFile = BehaviorSubject<File>();

  VideoWidgetBloc(this._videoUrl) {
    downloadVideo();
  }

  @override
  void dispose() {
    videoFile.close();
    super.dispose();
  }

  downloadVideo() async {
    showProgress(true);
    var file = await DefaultCacheManager().getSingleFile(_videoUrl);
    showProgress(false);
    videoFile.value = file;
  }

}