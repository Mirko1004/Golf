import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/community/community_bloc.dart';
import 'package:golf/pages/community/community_tab_bar.dart';
import 'package:golf/pages/community/discover/discover.dart';
import 'package:golf/pages/community/network/network.dart';
import 'package:golf/pages/community/rsvp/community_rsvp.dart';
import 'package:golf/utils/app_colors.dart';

import 'calendar/community_calendar.dart';

class Community extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  final CommunityBloc _communityBloc = CommunityBloc();
  StreamSubscription _currentPageSubscription;
  PageController _pageController;

  @override
  void initState() {

    _pageController = PageController(initialPage: _communityBloc.dataCache.communityCurrentPage.value);

    _currentPageSubscription = _communityBloc.dataCache.communityCurrentPage.listen((page) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(page);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(

      _communityBloc,

      null,

      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            CommunityTabBar(_communityBloc),

            Container(
              height: 1.0,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
              ),
            ),


            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (page) => _communityBloc.dataCache.communityCurrentPage.value = page,
                children: <Widget>[

                  Discover(),

                  CommunityCalendar(),

                  CommunityRSVP(),

                  Network(),

                ],
              ),
            ),


          ],
        ),
      ),


    );
  }
}
