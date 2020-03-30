import 'dart:async';
import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/home_page/post_row/post_row.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/pages/timeline_post/timeline_post_widget_bloc.dart';

class TimelinePostWidget extends StatefulWidget {

  final PostRowViewModel _timelinePost;

  TimelinePostWidget(this._timelinePost);

  @override
  State<StatefulWidget> createState() => _TimelinePostWidgetState(_timelinePost);
}

class _TimelinePostWidgetState extends State<TimelinePostWidget> {

  final TimelinePostBloc _timelinePostBloc;
  StreamSubscription _isDoneSubscription;

  _TimelinePostWidgetState(PostRowViewModel timelinePost) : _timelinePostBloc = TimelinePostBloc(timelinePost);


  @override
  void initState() {

    _isDoneSubscription = _timelinePostBloc.done.listen((done) {
      if (done)
          Navigator.of(context).pop();
    });

    super.initState();
  }


  @override
  void dispose() {
    _isDoneSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BaseBlocWidget(
      _timelinePostBloc,

      body(),

    );

  }

  body() {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          StreamBuilder<PostRowViewModel>(
            initialData: widget._timelinePost,
            stream: _timelinePostBloc.timelinePost,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return PostRow(snapshot.data, _timelinePostBloc.vote, _timelinePostBloc.deletePost, _timelinePostBloc.follow );
            },
          ),

        ],
      ),
    );

  }

}
