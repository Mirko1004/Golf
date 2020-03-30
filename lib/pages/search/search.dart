import 'package:flutter/material.dart';
import 'package:golf/pages/home/home_bloc.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/search/profiles_list.dart';

getSearch(BuildContext context, HomeBloc homeBloc) {
  return Scaffold(
    appBar: getDetailAppBar(context, 'SEARCH'),

    body: Column(
      children: <Widget>[
        Expanded(
          child: ProfilesList(
              homeBloc.session.profileViewLong.userOrganizations.first.orgId,
              true),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
        )
      ],
    ),
  );
}
