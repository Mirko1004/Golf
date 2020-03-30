import 'package:flutter/material.dart';
import 'package:golf/pages/common_widgets/modal_sheet.dart';
import 'package:golf/pages/home_page/likes/likes.dart';

class PostLikedBy extends StatelessWidget {

  final String postLikedByText;
  final Function onShowLikes;
  final String contentVoteId;
  final String contentVoteSystem;

  PostLikedBy(this.postLikedByText, this.onShowLikes, this.contentVoteId,this.contentVoteSystem);

  @override
  Widget build(BuildContext context) {

    if( postLikedByText.isEmpty )
      return Container();

    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: InkWell(
        onTap: () => YudizModalSheet.show( context: context, child: Likes(contentVoteId, contentVoteSystem), title: "LIKES" ),
        child: Text(postLikedByText,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16.0,
                  fontFamily: 'SFUIText-Medium',
                  color: Color(0xff8A9084)
              ),
            ),
      ),

    );
  }

}