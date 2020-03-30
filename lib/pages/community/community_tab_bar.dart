import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

import 'community_bloc.dart';

class CommunityTabBar extends StatefulWidget {

  final CommunityBloc _communityBloc;

  CommunityTabBar( this._communityBloc );

  @override
  State<StatefulWidget> createState() => _CommunityTabBarState();
}

class _CommunityTabBarState extends State<CommunityTabBar> {

  final ScrollController _scrollController = ScrollController();
  StreamSubscription _currentPageSubscription;


  @override
  void initState() {

    _currentPageSubscription = widget._communityBloc.dataCache.communityCurrentPage.listen((page) {
      if (_scrollController.hasClients) {
        if(page == 0)
          _scrollController.jumpTo(0.0);
        if(page == 3)
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    super.initState();
  }


  @override
  void dispose() {
    _currentPageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: StreamBuilder<int>(
        initialData: 0,
        stream: widget._communityBloc.dataCache.communityCurrentPage,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          List<Widget> widgets = List();
          widgets.add(_tabWidget( 0, 'DISCOVER', context, snapshot.data, widget._communityBloc));
          widgets.add(_tabWidget( 1, 'CALENDAR', context, snapshot.data, widget._communityBloc));
          widgets.add(_tabWidget( 2, 'RSVP', context, snapshot.data, widget._communityBloc));
          widgets.add(_tabWidget( 3, 'NETWORK', context, snapshot.data, widget._communityBloc));

          return ListView(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: widgets,
          );

        },
      ),
    );
  }
}

_tabWidget( int page, String text, BuildContext context, int currentPage, CommunityBloc communityBloc) {

  BoxDecoration underline = BoxDecoration(
    border: Border(
      bottom: BorderSide(width: 2.0, color: AppColors.greenColor2),
    ),
    color: Colors.white,
  );

  return InkWell(
    onTap: () {
      communityBloc.dataCache.communityCurrentPage.value = page;
    },
    child: Container(
      decoration: page == currentPage ? underline : null,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( text,
                style: AppStyles.getSFUITextMediumStyle(
                    16.0,
                    0.0,
                    currentPage == page ? AppColors.blackColor4 : AppColors.lightBlack,
                    FontWeight.w500)
            ),
          ],
        ),

      ),

    ),
  );
}
