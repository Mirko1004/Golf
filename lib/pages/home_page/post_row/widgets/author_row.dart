import 'package:flutter/material.dart';

class AuthorRow extends StatelessWidget {

  final String profileThumbUrl;
  final String profileTitle;
  final String profileOrganization;
  final bool isAllowedDeleteTimelineEntry;
  final bool isAllowedEditTimelineEntry;
  final Function onEditPost;
  final Function onDeletePost;
  final bool isLoggedUserFollowing;
  final Function onFollow;
  final String currentUserProfileId;
  final String authorProfileId;

  AuthorRow( this.profileThumbUrl, this.profileTitle, this.profileOrganization, this.isAllowedDeleteTimelineEntry, this.isAllowedEditTimelineEntry, this.onEditPost,
      this.onDeletePost, this.isLoggedUserFollowing, this.onFollow, this.currentUserProfileId, this.authorProfileId);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[


        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(profileThumbUrl),
        ),

        Padding( padding: EdgeInsets.only(left: 16.0),),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(profileTitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'SFUIText-Medium',
                    color: Color(0xff131E06)
                ),
              ),

              Padding( padding: EdgeInsets.only(top: 4.0),),

              Text( profileOrganization,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                    fontFamily: 'SFUIText-Medium',
                    color: Color(0x32131E06)
                ),
              ),


            ],

          ),
        ),

        if( isAllowedDeleteTimelineEntry || isAllowedEditTimelineEntry ) ... [
          _postActionPopup(),
        ],

      ],

    );
  }

  Widget _postActionPopup() {

    List<PopupMenuEntry<int>> itemsList = List();
    if( isAllowedEditTimelineEntry )
      itemsList.add( PopupMenuItem( value: 1, child: Text("Edit"), ));
    if( isAllowedDeleteTimelineEntry )
      itemsList.add( PopupMenuItem( value: 2, child: Text("Delete"), ));
    if(currentUserProfileId != authorProfileId)
      itemsList.add( PopupMenuItem( value: 3, child: Text( isLoggedUserFollowing ? "Unfollow" : "Follow"), ));

    return PopupMenuButton<int>(
      itemBuilder: (context) => itemsList,
      onSelected: (value) {

        if(value == 1)
          onEditPost();
        else if(value == 2)
          onDeletePost();
        else if(value == 3)
          onFollow( authorProfileId, !isLoggedUserFollowing );

      },
    );
  }
}
