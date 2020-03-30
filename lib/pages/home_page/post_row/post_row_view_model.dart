import 'package:golf/repository/network/model/get_timeline_posts_response.dart';
import 'package:golf/utils/utils.dart';

class PostRowViewModel {
  String id;
  String contentSystem;
  String currentUserProfileId;
  String postTitle;
  String postText;
  String profileThumbUrl;
  String profileTitle;
  String profileOrganization;
  List<String> images;
  Map<String, String> videos;
  String cntComments;
  bool liked;
  String postLikedByText;
  String postedAgoText;
  int mediaFilesCount;
  String contentVoteId;
  String contentVoteSystem;
  bool isAllowedDeleteTimelineEntry;
  bool isAllowedEditTimelineEntry;
  String ownerId;
  List<LinkAttach> linkAttach;
  String postUrl;
  bool isLoggedUserFollowing;
  String authorProfileId;

  PostRowViewModel({this.id, this.contentSystem, this.currentUserProfileId, this.postTitle, this.postText, this.profileThumbUrl, this.profileTitle,
    this.profileOrganization, this.images, this.videos, this.cntComments,
    this.liked, this.postLikedByText, this.postedAgoText, this.mediaFilesCount, this.contentVoteId, this.contentVoteSystem,
    this.isAllowedDeleteTimelineEntry, this.isAllowedEditTimelineEntry, this.ownerId, this.linkAttach, this.postUrl, this.isLoggedUserFollowing, this.authorProfileId});

  factory PostRowViewModel.fromTimelinePost(currentUserProfileId, TimelinePost timelinePost) {

    //Post text
    String postText = timelinePost.content.text;
    if(timelinePost.action == "profile_picture_changed")
      postText = "Changed a profile picture";

    //Author stuff
    String profileThumbUrl = timelinePost.author.profileThumbUrl;
    String profileTitle = timelinePost.author.profileTitle;
    String profileOrganization = "";
    if(timelinePost.author.profileModule == "bx_organizations")
      profileOrganization = timelinePost.author.profileTitle;
    else if (timelinePost.author.authorOrganizations != null && timelinePost.author.authorOrganizations.isNotEmpty)
      profileOrganization = timelinePost.author.authorOrganizations.first.orgName;

    //Media viewer.
    List<String> images = List();
    Map<String, String> videos = Map();

    if(timelinePost.content.imagesAttach != null ) {
      images.addAll(timelinePost.content.imagesAttach.map<String>((imageAttach) => imageAttach.src ));
    }
    if(timelinePost.content.videoAttach != null ) {
      timelinePost.content.videoAttach.forEach((videoAttach) {
        videos.putIfAbsent(videoAttach.srcPoster, () => videoAttach.srcMp4);
      });
    }
    if(timelinePost.content.images != null ) {
      images.add(timelinePost.content.images.first.src);
    }

    List<LinkAttach> links = List();
    if(timelinePost.content.linkAttach != null)
      links.addAll(timelinePost.content.linkAttach);
    int mediaFilesCount = images.length + videos.length + links.length;

    //Reaactions and comments row stuff
    String cntComments = timelinePost.cntComments;
    bool liked = timelinePost.reactions.performedByLoggedUser.isNotEmpty;

    //PostLikedBy stuff.
    //Filter for your loves
    List<ReactionPerson> loveByOthers = List()..addAll(timelinePost.reactions.loveByOthers);
    loveByOthers.removeWhere((reactionPerson) => reactionPerson.authorId == currentUserProfileId);

    String lovedBy = "";
    if (timelinePost.reactions.loveByFriends.isNotEmpty)
      lovedBy = timelinePost.reactions.loveByFriends.first.fullname;
    else if (loveByOthers.isNotEmpty)
      lovedBy = loveByOthers.first.fullname;

    String andOthersLove = "";
    if( (timelinePost.reactions.cntLove - 1) > 0 )
      andOthersLove = "and ${timelinePost.reactions.cntLove-1} others";

    String postLikedByText = "Liked by $lovedBy $andOthersLove";
    if( lovedBy.isEmpty )
      postLikedByText = "";

    //Post time stuff
    String postedAgoText = postedAgoString( int.parse(timelinePost.date) );

    return PostRowViewModel(
      id: timelinePost.id,
      contentSystem: timelinePost.contentSystem,
      currentUserProfileId: currentUserProfileId,
      postTitle: timelinePost.postTitle,
      postText: postText,
      profileThumbUrl: profileThumbUrl,
      profileTitle: profileTitle,
      profileOrganization: profileOrganization,
      images: images,
      videos: videos,
      cntComments: cntComments,
      liked: liked,
      postLikedByText: postLikedByText,
      postedAgoText: postedAgoText,
      mediaFilesCount: mediaFilesCount,
      contentVoteId: timelinePost.contentVoteId,
      contentVoteSystem: timelinePost.contentVoteSystem,
      isAllowedDeleteTimelineEntry: timelinePost.loggedUserAccessRights.isAllowedDeleteTimelineEntry,
      isAllowedEditTimelineEntry: timelinePost.loggedUserAccessRights.isAllowedEditTimelineEntry,
      ownerId: timelinePost.ownerId,
      linkAttach: timelinePost.content.linkAttach,
      postUrl: timelinePost.content.url,
      isLoggedUserFollowing: timelinePost.author.isLoggedUserFollowing,
      authorProfileId: timelinePost.author.profileId,
    );
  }

}