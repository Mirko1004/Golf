import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';

class CommentTextInputWidget extends StatefulWidget {

  final Function post;
  final String commentId;

  CommentTextInputWidget(this.post, this.commentId) : super(key: ValueKey(commentId) );

  @override
  State<StatefulWidget> createState() => _CommentTextInputWidgetState();
}

class _CommentTextInputWidgetState extends State<CommentTextInputWidget> {

  final TextEditingController postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double horizontalEdge = 0.0;
    if(widget.commentId == "0")
      horizontalEdge = 24.0;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only( left: horizontalEdge, bottom: 18.0),
        child: TextFormField(
            controller: postTextController,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    if (postTextController.text.isNotEmpty) {
                      widget.post(postTextController.text, widget.commentId);
                      postTextController.text = "";
                    }
                  },
                  child: Image.asset('assets/images/send_icon.png'),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyColor)),
                labelText: "add new comment",
                labelStyle: TextStyle(
                    fontFamily: 'SFUIText-Light',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0x4d000000)))),
      ),
    );
  }
}