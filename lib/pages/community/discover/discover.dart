import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/community/discover/browse_by_categories/browse_by_categories.dart';
import 'package:golf/pages/community/discover/discover_bloc.dart';
import 'package:golf/pages/community/discover/popular_events/popular_events.dart';
import 'package:golf/pages/community/discover/popular_this_week/popular_this_week.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';

class Discover extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  final DiscoverBloc _discoverBloc = DiscoverBloc();
  RefreshController _refreshController;

  @override
  Widget build(BuildContext context) {

    _refreshController = RefreshController();

    return Column(
      children: <Widget>[

        Expanded(
          child: StreamBuilder<List<PostRowViewModel>>(
            stream: _discoverBloc.popularThisWeekModelList,
            initialData: List(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              return SectionTableView(
                numOfRowInSection: (int section) => 1,
                sectionCount: 3,
                cellAtIndexPath: (int section, int row) {
                  if(section == 0)
                    return PopularEvents(_discoverBloc);
                  else if(section == 1)
                    return BrowseByCategories();
                  else
                    return PopularThisWeek(snapshot.data);
                } ,
                refreshController: _refreshController,
                  enablePullDown: true,
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
    await _discoverBloc.reloadData();
    _refreshController.sendBack(up, RefreshStatus.completed);
  }

}
