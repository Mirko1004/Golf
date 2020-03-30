import 'package:flutter/material.dart';
import 'package:golf/pages/member_list/member_list.dart';
import 'package:golf/pages/profile/profile_row.dart';

import '../home_bloc.dart';

getDrawer(BuildContext context, HomeBloc homeBloc) {
  return Drawer(
    child: Column(
      children: <Widget>[

        SafeArea(
          child: getProfileRow(homeBloc, true),
        ),

        Expanded(
          child: MemberList(homeBloc.session.profileViewLong.userOrganizations.first.orgId, true),
        ),

        Padding( padding: EdgeInsets.only(bottom: 20.0),)

      ],
    ),
  );
}
