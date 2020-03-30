class GetCommentResponse {
    List<Comment> comments;
    int actualRowsLoaded;
    bool loadMore;

    GetCommentResponse({this.comments, this.actualRowsLoaded, this.loadMore});

    factory GetCommentResponse.fromJson(Map<String, dynamic> json) {
        return GetCommentResponse(
          comments: json['data'] != null ? (json['data'] as List).map((i) => Comment.fromJson("0", i)).toList() : null,
          actualRowsLoaded: json['actual_rows_loaded'],
          loadMore: json['load_more'],
        );
    }
}

class Comment {
    String cmtParentId;
    List<Attach> attach;
    Author author;
    String cmtAuthorId;
    String cmtId;
    String cmtLevel;
    String cmtReplies;
    String cmtText;
    String cmtTime;
    String cmtUniqueId;
    List<Comment> replies;
    VoteData voteData;
    bool repliesExpanded = false;

    Comment(this.cmtParentId, {this.attach, this.author, this.cmtAuthorId, this.cmtId, this.cmtLevel, this.cmtReplies, this.cmtText, this.cmtTime, this.cmtUniqueId, this.replies, this.voteData, this.repliesExpanded});

    factory Comment.fromJson(String cmtParentId, Map<String, dynamic> json) {
        return Comment(
          cmtParentId,
          attach: json['attach'] != null ? (json['attach'] as List).map((i) => Attach.fromJson(i)).toList() : null,
          author: json['author'] != null ? Author.fromJson(json['author']) : null,
          cmtAuthorId: json['cmt_author_id'],
          cmtId: json['cmt_id'],
          cmtLevel: json['cmt_level'],
          cmtReplies: json['cmt_replies'],
          cmtText: json['cmt_text'],
          cmtTime: json['cmt_time'],
          cmtUniqueId: json['cmt_unique_id'],
          replies: json['replies'] != null ? (json['replies'] as List).map((i) => Comment.fromJson(json['cmt_unique_id'], i)).toList() : null,
          voteData: json['vote_data'] != null ? VoteData.fromJson(json['vote_data']) : null,
          repliesExpanded: false,
        );
    }
}

class VoteData {
    String cntVotes;
    bool performedByLoggedUser;

    VoteData({this.cntVotes, this.performedByLoggedUser});

    factory VoteData.fromJson(Map<String, dynamic> json) {
        return VoteData(
            cntVotes: json['cnt_votes'].toString(),
            performedByLoggedUser: json['performed_by_logged_user'],
        );
    }
}

class Attach {
    String file;
    String fileIcon;
    String fileName;
    String fileSize;
    String jsObject;
    String preview;

    Attach({this.file, this.fileIcon, this.fileName, this.fileSize, this.jsObject, this.preview});

    factory Attach.fromJson(Map<String, dynamic> json) {
        return Attach(
            file: json['file'],
            fileIcon: json['file_icon'],
            fileName: json['file_name'],
            fileSize: json['file_size'],
            jsObject: json['js_object'],
            preview: json['preview'],
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