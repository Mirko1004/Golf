import 'package:flutter/material.dart';
import 'package:golf/pages/home_page/likes/likes_bloc.dart';
import 'package:golf/repository/network/model/get_vote_persons.dart';

class LikesPersonRow extends StatelessWidget {

  final VotePerson _votePerson;
  final LikesBloc _likesBloc;
  final List<String> interests = ["golf", "tennis", "swimming", "fitness"];

  LikesPersonRow(this._votePerson, this._likesBloc);

  @override
  Widget build(BuildContext context) {

    String interestsStr = "";
    interests.forEach((interest) => interestsStr += "#$interest ");

    return       Container(
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          Padding( padding: EdgeInsets.only(left: 24.0) , ),

          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(_votePerson.profileThumbUrl),
          ),

          Padding( padding: EdgeInsets.only(left: 12.0) , ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text( _votePerson.profileTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'SFUIText-Medium',
                        color: Color(0xff323643)
                    )
                ),

                Padding(padding: EdgeInsets.only(top: 4.0),),

                Text( interestsStr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 10.0,
                        fontFamily: 'SFUIText-Medium',
                        color: Color(0xff7A7A7A)
                    )
                ),

              ],
            ),
          ),

          Padding( padding: EdgeInsets.only(left: 10.0), ),

          StreamBuilder<List<String>>(
            stream: _likesBloc.followedIdList,
            initialData: List(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if( _votePerson.profileId == _likesBloc.session.profileId )
                return Container();

              return InkWell(
                  onTap: () => _likesBloc.follow(_votePerson.profileId),
                  child: Container(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      height: 28.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(
                            color: Color(0xfff1d8bd), width: 1.0),
                        borderRadius: new BorderRadius.horizontal(),
                      ),
                      child: Center(
                        child: Text( snapshot.data.contains(_votePerson.profileId) ? 'disconnect' : 'connect',
                            style: TextStyle(
                                color: Color(0xff417505),
                                fontFamily: 'SFUIText-Medium',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.52,
                                fontSize: 14.0)),
                      )
                  ),
              );

            },
          ),

          Padding( padding: EdgeInsets.only(left: 24.0) , ),

        ],
      ),
    );
  }

}