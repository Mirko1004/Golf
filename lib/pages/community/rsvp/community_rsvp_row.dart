import 'package:flutter/material.dart';

class CommunityRsvpRow extends StatelessWidget {

  final Function acceptAccepted;
  final Stream acceptedIdList;
  final String profileId;
  final String name;
  final String imageUrl;

  CommunityRsvpRow( this.acceptAccepted, this.acceptedIdList, this.profileId, this.name, this.imageUrl );

  @override
  Widget build(BuildContext context) {

    double avatarRadius = 20.0;
    double rowHeight = 60.0;
    double profileNameFontSize = 14.0;
    double paddingTop = 2.0;
    double connectContainerHeight = 20.0;

    return InkWell(
      onTap: () => acceptAccepted(profileId),
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

                ],
              ),
            ),

            Padding( padding: EdgeInsets.only(left: 10.0), ),


            StreamBuilder<List<String>>(
              stream: acceptedIdList,
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