
class GetVotePersons {
    List<VotePerson> data;
    int actualRowsLoaded;
    bool loadMore;

    GetVotePersons({this.data, this.actualRowsLoaded, this.loadMore});

    factory GetVotePersons.fromJson(Map<String, dynamic> json) {
        return GetVotePersons(
            data: json['data'] != null ? (json['data'] as List).map((i) => VotePerson.fromJson(i)).toList() : null,
            actualRowsLoaded: json['actual_rows_loaded'],
            loadMore: json['load_more'],
        );
    }
}

class VotePerson {
    String cntFollowers;
    String cntFollowing;
    String cntFriends;
    bool isLoggedUserFollowing;
    bool isLoggedUserFriend;
    bool isLoggedUserFriendRequestPending;
    bool isActive;
    bool isOnline;
    List<Organization> organizations;
    String profileId;
    String profileModule;
    String profileThumbUrl;
    String profileTitle;

    VotePerson({this.cntFollowers, this.cntFollowing, this.cntFriends, this.isLoggedUserFollowing, this.isLoggedUserFriend, this.isLoggedUserFriendRequestPending, this.isActive, this.isOnline, this.organizations, this.profileId, this.profileModule, this.profileThumbUrl, this.profileTitle});

    factory VotePerson.fromJson(Map<String, dynamic> json) {
      return VotePerson(
        cntFollowers: json['cnt_followers'],
        cntFollowing: json['cnt_following'],
        cntFriends: json['cnt_friends'],
        isLoggedUserFollowing: json['isLoggedUserFollowing'],
        isLoggedUserFriend: json['isLoggedUserFriend'],
        isLoggedUserFriendRequestPending: json['isLoggedUserFriendRequestPending'],
        isActive: json['is_active'],
        isOnline: json['is_online'],
        organizations: json['organizations'] != null ? (json['organizations'] as List).map((i) => Organization.fromJson(i)).toList() : null,
        profileId: json['profile_id'],
        profileModule: json['profile_module'],
        profileThumbUrl: json['profile_thumb_url'],
        profileTitle: json['profile_title'],
      );
    }
}

class Organization {
    String orgId;
    String orgName;

    Organization({this.orgId, this.orgName});

    factory Organization.fromJson(Map<String, dynamic> json) {
      return Organization(
        orgId: json['org_id'],
        orgName: json['org_name'],
      );
    }
}

