import 'package:flutter/material.dart';

class PostPostedAgo extends StatelessWidget {

  final String postedAgoText;

  PostPostedAgo(this.postedAgoText);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[

        Text( postedAgoText,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 16.0,
              fontFamily: 'SFUIText-Medium',
              color: Color(0xff8A9084)
          ),
        ),

      ],
    );
  }

}