import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/create_post/create_post.dart';
import 'package:golf/pages/home_page/event_card/home_event_card.dart';
import 'package:golf/pages/home_page/highlights/highlights.dart';
import 'package:golf/pages/home_page/post_row/post_row.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';

import 'home_page_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageBloc _homePageBloc = HomePageBloc();
  RefreshController _refreshController;

  @override
  Widget build(BuildContext context) {

    return BaseBlocScaffoldWidget(

        _homePageBloc,

        null,

        getTimeline(),

        actionLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: FloatingActionButton(
            child: Image.asset('assets/images/add_post_fab.png'),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CreatePost())),
          ),
        )
    );
  }

  getTimeline() {
    return Column(
      children: <Widget>[

        Expanded(
          child: StreamBuilder<List<PostRowViewModel>>(
            stream: _homePageBloc.postRowViewModelList,
            initialData: List(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              _refreshController = RefreshController();

              return
                SectionTableView(
                numOfRowInSection: (int section) {
                  if(section < 2)
                    return 1;
                  else
                    return snapshot.data.length;
                },
                sectionCount: 3,
                cellAtIndexPath: (int section, int row) {
                  if(section == 0)
                    return Highlights(_homePageBloc);
                  else if(section == 1)
                    return HomeEventCard(_homePageBloc);
                  else
                    return PostRow( snapshot.data[row], _homePageBloc.vote, _homePageBloc.deletePost, _homePageBloc.follow );
                } ,
                refreshController: _refreshController,
                enablePullDown: true,
                enablePullUp: _homePageBloc.dataCache.loadMorePosts.value,
                refreshHeaderBuilder: getRefreshHeaderWidget,
                onRefresh: (up) => _refreshMessages(up),
              );
            },
          ),
        ),

      ],
    );
  }

  _refreshMessages(bool up) async {
    if (up) {
      await _homePageBloc.getData(false);
    } else
      await _homePageBloc.getData(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }
}
