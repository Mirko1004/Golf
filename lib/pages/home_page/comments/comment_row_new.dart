import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golf/pages/home_page/comments/comment_row.dart';
import 'package:golf/repository/network/model/get_comments_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'comment_text_input_widget.dart';

class CommentRowNew extends StatefulWidget {

  final Comment _comment;
  final Function voteComment;
  final Function postReply;

  CommentRowNew(this._comment, this.voteComment, this.postReply) : super(key: ValueKey(_comment.cmtId));

  @override
  State<StatefulWidget> createState() => _CommentRowNewState();
}

class _CommentRowNewState extends State<CommentRowNew> {

  bool reply = false;
  bool showReplies = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          CommentRow(widget._comment, widget.voteComment),

          if( widget._comment.replies.length == 0 && int.parse(widget._comment.cmtLevel) == 0 ) ... [

            Padding(
              padding: EdgeInsets.only(left: 68.0),
              child: InkWell(
                onTap: () => setState(() { showReplies = !showReplies; }),
                child: Text('Reply',
                    style: AppStyles.getSFUITextMediumStyle( 12.0, 0.0, AppColors.greenColor, FontWeight.w500)
                ),
              ),

            ),


          ],

          if(widget._comment.replies.length > 0) ... [

            Padding(
              padding: EdgeInsets.only(left: 68.0),
              child: InkWell(
                child: Text( showReplies ? "Hide Replies" : 'View Replies (${widget._comment.replies.length})',
                  style: AppStyles.getSFUITextMediumStyle(12.0, 0.0,
                      AppColors.greyColor24, FontWeight.w500),
                ),
                onTap: () => setState(() { showReplies = !showReplies; }),
              ),
            ),

          ],

          if(widget._comment.replies.length > 0 && showReplies) ... [

            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0 + ((int.parse(widget._comment.cmtLevel) * 30))),
              child: AbsorbPointer(
                absorbing: true,
                child: ListView(
//                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: widget._comment.replies.map<Widget>((comment) => CommentRow( comment, widget.voteComment)).toList(),
                ),
              ),

            ),



          ],

          if( widget._comment.cmtParentId == "0" && showReplies ) ... [

            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child:     CommentTextInputWidget( widget.postReply, widget._comment.cmtId ),
            ),

          ],

        ],
      ),

    );
  }
}
