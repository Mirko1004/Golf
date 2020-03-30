class TimelineData {
    List<TimelinePost> timelinePosts;
    int actualRowsLoaded;
    bool loadMore;

    TimelineData({this.timelinePosts, this.actualRowsLoaded, this.loadMore});

    factory TimelineData.fromJson(Map<String, dynamic> json) {
        return TimelineData(
          timelinePosts: json['data'] != null ? (json['data'] as List).map((i) => TimelinePost.fromJson(i)).toList() : null,
          actualRowsLoaded: json['actual_rows_loaded'],
          loadMore: json['load_more'],
        );
    }
}

class TimelinePost {
    String action;
    String active;
    String agoDays;
    Author author;
    String cntComments;
    String cntReports;
    String cntTimelineViews;
    String cntViews;
    String cntVotes;
    Content content;
    String contentCmtVoteId;
    String contentCmtVoteSystem;
    String contentId;
    String contentSystem;
    String contentVoteId;
    String contentVoteSystem;
    String date;
    String days;
    String description;
    String id;
    LoggedUserAccessRights loggedUserAccessRights;
    String objectId;
    String objectOwnerId;
    String objectPrivacyView;
    String ownerId;
    String pinned;
    String promoted;
    String published;
    String publishedDateUtc;
    String rate;
    Reactions reactions;
    String sticked;
    String title;
    String postTitle;
    String today;
    String type;
    String year;

    TimelinePost({this.action, this.active, this.agoDays, this.author, this.cntComments, this.cntReports, this.cntTimelineViews, this.cntViews, this.cntVotes, this.content, this.contentCmtVoteId, this.contentCmtVoteSystem, this.contentId, this.contentSystem, this.contentVoteId, this.contentVoteSystem, this.date, this.days, this.description, this.id, this.loggedUserAccessRights, this.objectId, this.objectOwnerId, this.objectPrivacyView, this.ownerId, this.pinned, this.promoted, this.published, this.publishedDateUtc, this.rate, this.reactions, this.sticked, this.postTitle, this.title, this.today, this.type, this.year});

    factory TimelinePost.fromJson(Map<String, dynamic> json) {
        return TimelinePost(
            action: json['action'],
            active: json['active'],
            agoDays: json['ago_days'],
            author: json['author'] != null ? Author.fromJson(json['author']) : null,
            cntComments: json['cnt_comments'],
            cntReports: json['cnt_reports'],
            cntTimelineViews: json['cnt_timeline_views'],
            cntViews: json['cnt_views'],
            cntVotes: json['cnt_votes'],
            content: json['content'] != null ? Content.fromJson(json['content']) : null,
            contentCmtVoteId: json['content_cmt_vote_id'],
            contentCmtVoteSystem: json['content_cmt_vote_system'],
            contentId: json['content_id'],
            contentSystem: json['content_system'],
            contentVoteId: json['content_vote_id'],
            contentVoteSystem: json['content_vote_system'],
            date: json['date'],
            days: json['days'],
            description: json['description'],
            id: json['id'],
            loggedUserAccessRights: json['logged_user_access_rights'] != null ? LoggedUserAccessRights.fromJson(json['logged_user_access_rights']) : null,
            objectId: json['object_id'],
            objectOwnerId: json['object_owner_id'],
            objectPrivacyView: json['object_privacy_view'],
            ownerId: json['owner_id'],
            pinned: json['pinned'],
            promoted: json['promoted'],
            published: json['published'],
            publishedDateUtc: json['published_date_utc'],
            rate: json['rate'],
            reactions: json['reactions'] != null ? Reactions.fromJson(json['reactions']) : null,
            sticked: json['sticked'],
            postTitle: json['post_title'],
            title: json['title'],
            today: json['today'],
            type: json['type'],
            year: json['year'],
        );
    }
}

class Reactions {
    int cntLove;
    List<ReactionPerson> loveByFriends;
    List<ReactionPerson> loveByOthers;
    String performedByLoggedUser;

    Reactions({this.cntLove, this.loveByFriends, this.loveByOthers, this.performedByLoggedUser});

    factory Reactions.fromJson(Map<String, dynamic> json) {
        return Reactions(
          cntLove: json["cnt_love"],
            loveByFriends: json['love_by_friends'] != null ? (json['love_by_friends'] as List).map((i) => ReactionPerson.fromJson(i)).toList() : null,
            loveByOthers: json['love_by_others'] != null ? (json['love_by_others'] as List).map((i) => ReactionPerson.fromJson(i)).toList() : null,
            performedByLoggedUser: json['performed_by_logged_user'],
        );
    }
}

class ReactionPerson {
  String authorId;
  String fullname;

  ReactionPerson({this.authorId, this.fullname});

  factory ReactionPerson.fromJson(Map<String, dynamic> json) {
    return ReactionPerson(
      authorId: json['author_id'],
      fullname: json['fullname'],
    );
  }

}

class Content {
    String id;
    List<ImageProfile> images;
    String text;
    String title;
    String url;
    List<ImagesAttach> imagesAttach;
    List<VideoAttach> videoAttach;
    List<LinkAttach> linkAttach;

    Content({this.id, this.images, this.text, this.title, this.url, this.imagesAttach, this.videoAttach, this.linkAttach});

    factory Content.fromJson(Map<String, dynamic> json) {
      Map<String, dynamic> vidattachesMap = json['videos_attach'];
      var vidAttaches;
      if(vidattachesMap != null)
        vidAttaches = vidattachesMap.values.map((videoAttach) => VideoAttach.fromJson(videoAttach)).toList();

      return Content(
        id: json['id'],
        images: json['images'] != null ? (json['images'] as List).map((i) => ImageProfile.fromJson(i)).toList() : null,
        text: json['text'] != null ? json['text'] : "",
        title: json['title'],
        url: json['url'],
        imagesAttach: json['images_attach'] != null ? (json['images_attach'] as List).map((i) => ImagesAttach.fromJson(i)).toList() : null,
        videoAttach: vidAttaches,
        linkAttach: json['links'] != null ? (json['links'] as List).map((i) => LinkAttach.fromJson(i)).toList() : null,
      );
    }
}

class LinkAttach {
    String url;
    String title;
    String text;
    String thumbnail;

    LinkAttach({this.url, this.title, this.text, this.thumbnail});

    factory LinkAttach.fromJson(Map<String, dynamic> json) {
        return LinkAttach(
            url: json['url'],
            title: json['title'],
            text: json['text'],
            thumbnail: json['thumbnail'],
        );
    }
}

class ImageProfile {
    String src;
    String srcOrig;
    String url;

    ImageProfile({this.src, this.srcOrig, this.url});

    factory ImageProfile.fromJson(Map<String, dynamic> json) {
        return ImageProfile(
            src: json['src'],
            srcOrig: json['src_orig'],
            url: json['url'],
        );
    }
}

class VideoAttach {
  String id;
  String srcMp4;
  String srcMp4Hd;
  String srcPoster;

  VideoAttach({this.id, this.srcMp4, this.srcMp4Hd, this.srcPoster});

  factory VideoAttach.fromJson(Map<String, dynamic> json) {
    return VideoAttach(
      id: json['id'],
      srcMp4: json['src_mp4'],
      srcMp4Hd: json['src_mp4_hd'],
      srcPoster: json['src_poster'],
    );
  }
}

class ImagesAttach {
  String src;
  String srcMedium;
  String srcOrig;

  ImagesAttach({this.src, this.srcMedium, this.srcOrig});

  factory ImagesAttach.fromJson(Map<String, dynamic> json) {
    return ImagesAttach(
      src: json['src'],
      srcMedium: json['src_medium'],
      srcOrig: json['src_orig'],
    );
  }
}

class LoggedUserAccessRights {
    bool isAllowedComment;
    bool isAllowedDeleteTimelineEntry;
    bool isAllowedEditTimelineEntry;
    bool isAllowedReaction;
    bool isAllowedReport;
    bool isAllowedVote;

    LoggedUserAccessRights({this.isAllowedComment, this.isAllowedDeleteTimelineEntry, this.isAllowedEditTimelineEntry, this.isAllowedReaction, this.isAllowedReport, this.isAllowedVote});

    factory LoggedUserAccessRights.fromJson(Map<String, dynamic> json) {
        return LoggedUserAccessRights(
            isAllowedComment: json['isAllowedComment'],
            isAllowedDeleteTimelineEntry: json['isAllowedDeleteTimelineEntry'],
            isAllowedEditTimelineEntry: json['isAllowedEditTimelineEntry'],
            isAllowedReaction: json['isAllowedReaction'],
            isAllowedReport: json['isAllowedReport'],
            isAllowedVote: json['isAllowedVote'],
        );
    }
}

class Author {
    String cntFollowers;
    String cntFollowing;
    String cntFriends;
    bool isLoggedUserFollowing;
    bool isLoggedUserFriend;
    bool isLoggedUserFriendRequestPending;
    bool isActive;
    bool isOnline;
    String profileId;
    String profileModule;
    String profileThumbUrl;
    String profileTitle;
    List<AuthorOrganization> authorOrganizations;

    Author({this.cntFollowers, this.cntFollowing, this.cntFriends, this.isLoggedUserFollowing, this.isLoggedUserFriend, this.isLoggedUserFriendRequestPending, this.isActive, this.isOnline, this.profileId, this.profileModule, this.profileThumbUrl, this.profileTitle, this.authorOrganizations});

    factory Author.fromJson(Map<String, dynamic> json) {

      return Author(
        cntFollowers: json['cnt_followers'],
        cntFollowing: json['cnt_following'],
        cntFriends: json['cnt_friends'],
        isLoggedUserFollowing: json['isLoggedUserFollowing'],
        isLoggedUserFriend: json['isLoggedUserFriend'],
        isLoggedUserFriendRequestPending: json['isLoggedUserFriendRequestPending'],
        isActive: json['is_active'],
        isOnline: json['is_online'],
        profileId: json['profile_id'],
        profileModule: json['profile_module'],
        profileThumbUrl: json['profile_thumb_url'],
        profileTitle: json['profile_title'],
        authorOrganizations: json['organizations'] != null ? (json['organizations'] as List).map((i) => AuthorOrganization.fromJson(i)).toList() : null,
      );
    }
}

class AuthorOrganization {
    String orgId;
    String orgName;

    AuthorOrganization({this.orgId, this.orgName});

    factory AuthorOrganization.fromJson(Map<String, dynamic> json) {
        return AuthorOrganization(
            orgId: json['org_id'],
            orgName: json['org_name'],
        );
    }
}