import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class PostReactions extends StatelessWidget {

  final String postId;
  final bool liked;
  final String commentCount;
  final int mediaFilesCount;
  final int mediaFilesPosition;
  final String postUrl;
  final Function onCommentClick;
  final Function onVoteClick;

  PostReactions( this.postId, this.commentCount, this.liked, this.mediaFilesCount, this.mediaFilesPosition, this.postUrl, this.onCommentClick, this.onVoteClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Stack(
        children: <Widget>[

          if(mediaFilesCount > 1) ... [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DotsIndicator(
                  dotsCount: mediaFilesCount,
                  position: mediaFilesPosition.toDouble(),
                  decorator: DotsDecorator(
                    color: Color(0xffC9C9C9),
                    activeColor: Color(0xffF1D8BD),
                  ),
                ),
              ],
            ),

          ],

          Row(
            children: <Widget>[

              InkWell(
                radius: 20.0,
                onTap: () => onVoteClick(postId),
                child: Container(
                  height: 30.0,
                  width: 20.0,
                  child: Image.asset(liked ? "assets/images/like_selected.png" : "assets/images/like_not_selected.png"),
                ),
              ),

              Padding( padding: EdgeInsets.only(left: 26.0), ),

              InkWell(
                onTap: () => onCommentClick(),
                child: Container(
                  height: 30.0,
                  width: 20.0,
                  child: Image.asset( "assets/images/comment.png" ),
                ),
              ),

              Padding( padding: EdgeInsets.only(left: 6.0), ),

              InkWell(
                onTap: () => onCommentClick(),
                child: Text( commentCount,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16.0,
                      fontFamily: 'SFUIText-Medium',
                      color: Color(0xff8A9084)
                  ),
                ),
              ),

              Spacer(),

              InkWell(
                onTap: () => Share.share(postUrl),
                child: Image.asset("assets/images/share.png"),
              ),

//              _postActionPopup(),

            ],
          ),

        ],
      ),
    );
  }

  Widget _postActionPopup() {

    List<PopupMenuEntry<int>> itemsList = List();
      itemsList.add( PopupMenuItem( value: 1, child: _actionChild("assets/images/facebook.png", "Facebook"), ));
      itemsList.add( PopupMenuItem( value: 2, child: _actionChild("assets/images/twitter.png", "Twitter"), ));

    return PopupMenuButton<int>(
      child: Image.asset("assets/images/share.png"),
      itemBuilder: (context) => itemsList,
      onSelected: (value) {
        if(value == 1){
          String Url = "https://www.facebook.com/sharer/sharer.php?u=$postUrl";
          _launchURL(Url);
        }
        else{
//          String Url = "https://www.linkedin.com/shareArticle?mini=true&url=$postUrl&title=&summary=$postUrl&source=";
          String Url = "https://twitter.com/home?status=$postUrl";
          _launchURL(Url);

        }
      },
    );
  }

  _actionChild(String image, String text) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Image.asset(image),

          Padding( padding: EdgeInsets.only( left: 12.0), ),

          Text(text),

        ],
      ),
    );
  }

  _launchURL(String postUrl) async {


    const url = 'https://flutter.dev';
    if (await canLaunch(postUrl)) {
      await launch(postUrl);
    } else {
      throw 'Could not launch $url';
    }
  }
}
