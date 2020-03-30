import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:golf/repository/network/model/get_comments_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class CommentRow extends StatelessWidget {

  final Comment _comment;
  final Function voteComment;

  CommentRow(this._comment, this.voteComment) : super(key: ValueKey(_comment.cmtId));

  @override
  Widget build(BuildContext context) {

    //Post time stuff
    DateTime postDatetime = DateTime.fromMillisecondsSinceEpoch(int.parse(_comment.cmtTime)*1000);
    DateTime now = DateTime.now().toUtc();
    Duration dd = now.difference(postDatetime);
    final seconds = dd.inSeconds;
    final minutes = dd.inMinutes;
    final hours = dd.inHours;
    final days = dd.inDays;

    String postAgoText = "";
    String timeUnit = "";
    if (days > 0){
      postAgoText = days.toString();
      timeUnit = "days";
    }
    else if (hours > 0){
      postAgoText = hours.toString();
      timeUnit = "hours";
    }
    else if (minutes > 0){
      postAgoText = minutes.toString();
      timeUnit = "minutes";
    }
    else  {
      postAgoText = seconds.toString();
      timeUnit = "seconds";
    }
    String postedAgoText = "$postAgoText $timeUnit ago";

    int commentVotes = 0;
    if(_comment.voteData.performedByLoggedUser && int.parse(_comment.voteData.cntVotes) > 0)
      commentVotes = int.parse(_comment.voteData.cntVotes) - 1;


    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        CircleAvatar(
          radius: 24.0,
          backgroundImage: NetworkImage(_comment.author.profileThumbUrl),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text( _comment.author.profileTitle,
                      style: AppStyles.getSFUITextMediumStyle( 16.0, 0.0, AppColors.greyColor26, FontWeight.w500)
                  ),

                  Padding( padding: EdgeInsets.only(top: 8.0),),

                  Html(
                      data: _comment.cmtText,
                      shrinkToFit: true,
                      useRichText: true,
                      defaultTextStyle: AppStyles.getSFUITextRegularStyle( 16.0, 0.0, AppColors.blackColor4, FontWeight.w400)
                  ),

                  Padding( padding: EdgeInsets.only(top: 8.0),),

                  Text( postedAgoText, style: AppStyles.getRobotoLightStyle4() ),

                  Padding( padding: EdgeInsets.only(top: 8.0),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      if(commentVotes > 0) ... [
                        Text('$commentVotes Likes',
                            style: AppStyles.getSFUITextMediumStyle(
                                12.0,
                                0.0,
                                AppColors.greenColor,
                                FontWeight.w500)),

                        Padding( padding: EdgeInsets.only(left: 24.0),),
                      ],

                    ],
                  ),

                  Padding( padding: EdgeInsets.only(top: 8.0),),

                ],
              ),
            ),
          ),

        ),

        InkWell(
          onTap: () => voteComment( _comment.cmtUniqueId, _comment.cmtParentId ),
          child: Container(
            width: 14.0,
            height: 14.0,
            child: Image.asset( _comment.voteData.performedByLoggedUser ? "assets/images/like_selected.png" : "assets/images/like_not_selected.png"),
          ),

        ),

        Padding( padding: EdgeInsets.only(left: 8.0),),

      ],
    );
  }
}