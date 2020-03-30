
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostTextRow extends StatelessWidget {

  final String postText;

  const PostTextRow(this.postText);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Expanded(
          child: Html(
            data: postText,
            defaultTextStyle: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14.0,
                fontFamily: 'SFUIText-Medium',
                color: Colors.black
            ),
          ),
        ),


      ],
    );
  }

}