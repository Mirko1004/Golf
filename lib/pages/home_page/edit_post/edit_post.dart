import 'dart:async';
import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/create_post/post_app_bar.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

import 'edit_post_bloc.dart';

class EditPost extends StatefulWidget {

  final String postId;
  final String postText;

  EditPost(this.postId, this.postText);

  @override
  State<StatefulWidget> createState() => _EditPostState(postId, postText);
}

class _EditPostState extends State<EditPost> {

  final EditPostBloc _editPostBloc;
  final TextEditingController _postText = TextEditingController();
  StreamSubscription _doneSubscription;

  _EditPostState(String postId, String postText) : _editPostBloc = EditPostBloc(postId, postText);

  @override
  void initState() {
    _postText.text = widget.postText;
    _doneSubscription = _editPostBloc.done.listen((done) {
      if (done) Navigator.of(context).pop();
    });
    super.initState();
  }

  @override
  void dispose() {
    _doneSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(

      _editPostBloc,

      getPostAppBar(context, _editPostBloc, 'EDIT POST', () => Navigator.of(context).pop() ),

      GestureDetector(

        onVerticalDragDown: (dragDownDetails) {
          if (MediaQuery.of(context).viewInsets.bottom > 0.0) FocusScope.of(context).requestFocus(new FocusNode());
        },

        child: Stack(
          children: <Widget>[

            Column(
              children: <Widget>[

                Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        controller: _postText,
                        decoration: InputDecoration.collapsed(
                            hintText: "Share or post something...",
                            hintStyle: TextStyle(
                                fontFamily: 'SFrancisco',
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: AppColors.blackColor3)
                        )
                    )
                ),

              ],
            ),

            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: SafeArea(
                child: actionsRow(_editPostBloc),
              ),

            ),

          ],
        ),

      ),

    );
  }

  actionsRow(EditPostBloc editPostBloc) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          Container(
              width: 97.0,
              height: 40.0,
              decoration: new BoxDecoration(
                color: AppColors.lightWhite2,
                border:
                new Border.all(color: AppColors.orangeColor, width: 1.0),
                borderRadius: new BorderRadius.horizontal(),
              ),
              child: InkWell(
                  onTap: () {
                    if( _postText.text.isEmpty || _editPostBloc.postText == _postText.text )
                      return;

                    _editPostBloc.postSubmit(_postText.text);
                  },
                  child: Center(
                    child: Text(
                      "POST",
                      style: AppStyles.getSurannaStyle2(
                          20.0, 1.38, AppColors.greenColor, 2.0),
                    ),
                  )
              )
          ),

        ],
      ),
    );
  }
}
