import 'package:flutter/material.dart';

class MemberRow extends StatelessWidget {

  final bool _fromDrawer;
  final Function connectDisconnect;
  final Stream followedIdList;
  final String profileId;
  final String name;
  final String imageUrl;
  final List<String> interests;
  final String bio;

  MemberRow( this._fromDrawer, this.connectDisconnect, this.followedIdList, this.profileId, this.name, this.imageUrl, this.interests, this.bio );

  @override
  Widget build(BuildContext context) {

    String sports = interests.map((interest) =>  "#$interest" ).toList().join(" ");

    double avatarRadius = 25.0;
    double rowHeight = 80.0;
    double profileNameFontSize = 18.0;
    double paddingTop = 8.0;
    double connectContainerHeight = 28.0;
    if(_fromDrawer){
      avatarRadius = 20.0;
      rowHeight = 60.0;
      profileNameFontSize = 14.0;
      paddingTop = 2.0;
      connectContainerHeight = 20.0;
    }


    return InkWell(
      onTap: () => connectDisconnect(profileId),
      child: Container(
        height: rowHeight,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(imageUrl),
            ),

            Padding( padding: EdgeInsets.only(left: 8.0) , ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text( name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: profileNameFontSize,
                          fontFamily: 'SFUIText-Medium',
                          letterSpacing: 0.77,
                          color: Color(0xff323643)
                      )
                  ),

                  Padding(padding: EdgeInsets.only(top: paddingTop),),

                  Text( sports,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w100,
//                          fontFamily: 'SFUIText-Medium',
                          color: Color(0xff323643)
                      )
                  ),

                  Padding(padding: EdgeInsets.only(top: paddingTop),),

                  Text(
                      bio,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w100,
                          color: Color(0xff323643)
                      )
                  ),

                ],
              ),
            ),

            Padding( padding: EdgeInsets.only(left: 10.0), ),


          StreamBuilder<List<String>>(
            stream: followedIdList,
            initialData: List(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              return Container(
                  height: connectContainerHeight,
                  child: snapshot.data.contains(profileId) ? Image.asset('assets/images/contact_connected.png') : Image.asset('assets/images/contact_not_connected.png'),
              );

            },
          ),

          ],
        ),
      ),
    );

  }

}