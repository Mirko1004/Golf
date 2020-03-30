import 'package:flutter/material.dart';
import 'package:golf/pages/home_page/comments/comments.dart';
import 'package:golf/pages/home_page/edit_post/edit_post.dart';
import 'package:golf/pages/home_page/likes/likes.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/pages/home_page/post_row/widgets/author_row.dart';
import 'package:golf/pages/home_page/post_row/widgets/post_liked_by.dart';
import 'package:golf/pages/home_page/post_row/widgets/post_media_viewer.dart';
import 'package:golf/pages/home_page/post_row/widgets/post_posted_ago.dart';
import 'package:golf/pages/home_page/post_row/widgets/post_reactions.dart';
import 'package:golf/pages/home_page/post_row/widgets/post_text_row.dart';
import 'package:rxdart/rxdart.dart';

class PostRow extends StatefulWidget {

  final PostRowViewModel _postRowViewModel;
  final Function vote;
  final Function deletePost;
  final Function onFollow;

  PostRow(this._postRowViewModel, this.vote, this.deletePost, this.onFollow);

  @override
  State<StatefulWidget> createState() => _PostRowState();
}

class _PostRowState extends State<PostRow> {

  final BehaviorSubject<int> currentMediaViewerPage = BehaviorSubject<int>.seeded( 0 );

  @override
  void dispose() {
    currentMediaViewerPage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[

              //Author row
              AuthorRow( widget._postRowViewModel.profileThumbUrl, widget._postRowViewModel.profileTitle, widget._postRowViewModel.profileOrganization,
                  widget._postRowViewModel.isAllowedDeleteTimelineEntry, widget._postRowViewModel.isAllowedEditTimelineEntry, onEditPost, onDeletePost,
                  widget._postRowViewModel.isLoggedUserFollowing, onFollow, widget._postRowViewModel.currentUserProfileId, widget._postRowViewModel.authorProfileId ),

              Padding( padding: EdgeInsets.only(top: 24.0),),

              PostTextRow(widget._postRowViewModel.postText),

              Padding( padding: EdgeInsets.only(top: 8.0),),

            ],

          ),
        ),

        //Image
        PostMediaViewer( widget._postRowViewModel.images, widget._postRowViewModel.videos,
            widget._postRowViewModel.linkAttach == null ? List() : widget._postRowViewModel.linkAttach.map((linkAttach) => linkAttach.url).toList(),
            onMediaViewerPageChanged ),

        StreamBuilder<int>(
            stream: currentMediaViewerPage,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot pageSnapshot){
              return PostReactions( widget._postRowViewModel.id, widget._postRowViewModel.cntComments, widget._postRowViewModel.liked, widget._postRowViewModel.mediaFilesCount,
                  pageSnapshot.data, widget._postRowViewModel.postUrl, onCommentClick, widget.vote);
            }
        ),


        PostLikedBy( widget._postRowViewModel.postLikedByText, onShowLikes, widget._postRowViewModel.contentVoteId,widget._postRowViewModel.contentVoteSystem ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          child: PostPostedAgo( widget._postRowViewModel.postedAgoText ),
        ),


        Container(
          color: Colors.white,
          padding: EdgeInsets.all(12.0),
        ),

      ],
    );

  }

  onMediaViewerPageChanged(int page) => currentMediaViewerPage.value = page;

  onCommentClick(){
    Navigator.of(context).push( MaterialPageRoute(builder: (context) =>(Comments( widget._postRowViewModel.id, widget._postRowViewModel.contentSystem ))));
  }

  onShowLikes() {
    _showBottomSheet( Likes( widget._postRowViewModel.contentVoteId, widget._postRowViewModel.contentVoteSystem ));
  }

  _showBottomSheet(Widget child){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)), ),
        builder: (context) {
          return Container(
            child: child,
          );
        });
  }

  onEditPost() {
    Navigator.of(context).push( MaterialPageRoute(builder: (context) => EditPost(widget._postRowViewModel.id, widget._postRowViewModel.postText)));
  }

  onDeletePost() {
    widget.deletePost(widget._postRowViewModel.id, widget._postRowViewModel.ownerId);
  }

  onFollow(String userId, bool follow) {
    widget.onFollow(widget._postRowViewModel.id, userId, follow);
  }
}
