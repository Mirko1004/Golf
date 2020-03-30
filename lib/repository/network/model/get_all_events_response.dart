import 'package:golf/repository/network/model/profile_view_short.dart';

class GetAllEventsResponse {
    List<Event> events;
    int actualRowsLoaded;
    bool loadMore;

    GetAllEventsResponse({this.events, this.actualRowsLoaded, this.loadMore});

    factory GetAllEventsResponse.fromJson(Map<String, dynamic> json) {
        return GetAllEventsResponse(
            events: json['data'] != null ? (json['data'] as List).map((i) => Event.fromJson(i)).toList() : null,
            actualRowsLoaded: json['actual_rows_loaded'],
            loadMore: json['load_more'],
        );
    }
}

class Event {
    int admins;
    String allowViewTo;
    String allowViewToName;
    Author author;
    String authorId;
    String comments;
    String contentId;
    String cover;
    String dateEnd;
    String dateEndUtc;
    String dateStart;
    String dateStartUtc;
    String description;
    String eventCat;
    String eventCatName;
    String followers;
    String id;
    bool isLoggedUserAdmin;
    bool isLoggedUserAllowedPost;
    bool isLoggedUserFollowing;
    bool isLoggedUserMember;
    bool isLoggedUserIgnore;
    bool isLoggedUserInterested;
    String link;
    String location;
    String participants;
    String timezone;
    String title;
    String views;
    String votes;
    List<ProfileViewShort> members;

    Event({this.admins, this.allowViewTo, this.allowViewToName, this.author, this.authorId,
      this.comments, this.contentId, this.cover, this.dateEnd, this.dateEndUtc, this.dateStart,
      this.dateStartUtc, this.description, this.eventCat, this.eventCatName, this.followers,
      this.id, this.isLoggedUserAdmin, this.isLoggedUserAllowedPost, this.isLoggedUserFollowing,
      this.isLoggedUserMember, this.link, this.location, this.participants, this.timezone,
      this.title, this.views, this.votes, this.members, this.isLoggedUserIgnore, this.isLoggedUserInterested});

    factory Event.fromJson(Map<String, dynamic> json) {

      List<ProfileViewShort> members = json['members'] != null ? (json['members'] as List).map((i) => ProfileViewShort.fromJson(i)).toList() : null;

      return Event(
        admins: json['admins'],
        allowViewTo: json['allow_view_to'],
        allowViewToName: json['allow_view_to_name'],
        author: json['author'] != null ? Author.fromJson(json['author']) : null,
        authorId: json['author_id'],
        comments: json['comments'],
        contentId: json['content_id'],
        cover: json['cover'],
        dateEnd: json['date_end'],
        dateEndUtc: json['date_end_utc'],
        dateStart: json['date_start'],
        dateStartUtc: json['date_start_utc'],
        description: json['description'],
        eventCat: json['event_cat'],
        eventCatName: json['event_cat_name'],
        followers: json['followers'],
        id: json['id'],
        isLoggedUserAdmin: json['isLoggedUserAdmin'],
        isLoggedUserAllowedPost: json['isLoggedUserAllowedPost'],
        isLoggedUserFollowing: json['isLoggedUserFollowing'],
        isLoggedUserMember: json['isLoggedUserMember'],
        isLoggedUserIgnore: json['isLoggedUserIgnore'],
        isLoggedUserInterested: json['isLoggedUserInterested'],
        link: json['link'],
        location: json['location'],
        participants: json['participants'],
        timezone: json['timezone'],
        title: json['title'],
        views: json['views'],
        votes: json['votes'],
        members: members,
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
