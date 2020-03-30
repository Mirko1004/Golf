import 'package:flutter/material.dart';
import 'package:golf/pages/home/home_bloc.dart';

class HomeBottomBar extends StatelessWidget {

  final HomeBloc _homeBloc;

  HomeBottomBar(this._homeBloc);


  @override
  Widget build(BuildContext context) {

    return StreamBuilder<int>(
      initialData: 0,
      stream: _homeBloc.dataCache.currentPage,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        List<Widget> widgets = List();
        widgets.add(_tabWidget(0, "Home", _homeBloc, context, snapshot.data, "assets/images/home.png", "assets/images/home-active.png"));
        widgets.add(_tabWidget(1, "Community", _homeBloc, context, snapshot.data, "assets/images/community.png", "assets/images/community-active.png"));
        widgets.add(_tabWidget(2, "Play", _homeBloc, context, snapshot.data, "assets/images/game.png", "assets/images/game-active.png"));
        widgets.add(_tabWidget(3, "Pro shop", _homeBloc, context, snapshot.data, "assets/images/proshop.png", "assets/images/proshop-active.png"));
        widgets.add(_tabWidget(4, "Profile", _homeBloc, context, snapshot.data, "assets/images/profile.png", "assets/images/profile-active.png"));

        return BottomAppBar(
          child: Container(
            height: 58.0,
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1.0, color: Color(0xdddddddd)))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: widgets,
            ),
          ),
        );

      },
    );
  }

}

Widget _tabWidget(
    int page,
    String text,
    HomeBloc homeBloc,
    BuildContext context,
    int currentPage,
    String image,
    String imageSelected,
    ) {

  BoxDecoration underline = BoxDecoration(
    border: Border(
      top: BorderSide(width: 3.0, color: Color(0xffF1D8BD)),
    ),
    color: Colors.white,
  );

  return Expanded(
    child: InkWell(
      onTap: () {
        homeBloc.dataCache.currentPage.value = page;
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(height: 70.0),
          child: Container(
            decoration: page == currentPage ? underline : null,
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  page == currentPage ? imageSelected : image,
                  height: 23.0,
                  width: 23.0,
                ),
                Padding( padding: EdgeInsets.only(top: 4.0),),
                Text(
                  "$text",
                  style: TextStyle(
                      fontFamily: 'SFUIText-Medium',
                      fontSize: 10.0,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
