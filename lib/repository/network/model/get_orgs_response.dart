
class GetOrgsResponse {
    List<Organization> organizationList;
    int actualRowsLoaded;
    bool loadMore;

    GetOrgsResponse({this.organizationList, this.actualRowsLoaded, this.loadMore});

    factory GetOrgsResponse.fromJson(Map<String, dynamic> json) {
        return GetOrgsResponse(
            organizationList: json["data"] != null ? (json["data"] as List).map((i) => Organization.fromJson(i)).toList() : null,
            actualRowsLoaded: json['actual_rows_loaded'],
            loadMore: json['load_more'],
        );
    }

    factory GetOrgsResponse.fromProfileJson(Map<String, dynamic> json) {
        return GetOrgsResponse(
            organizationList: json["data"] != null ? (json["data"] as List).map((i) => Organization.fromProfileJson(i)).toList() : null,
            actualRowsLoaded: json['actual_rows_loaded'],
            loadMore: json['load_more'],
        );
    }
}

class Organization {
    String cover;
    String description;
    String followers;
    String friends;
    String id;
    bool isLoggedUserAllowedPost;
    bool isLoggedUserFollowing;
    bool isLoggedUserFriend;
    bool isLoggedUserMember;
    String link;
    String members;
    String picture;
    String thumb;
    String title;
    List<Sport> sports;

    Organization({this.cover, this.description, this.followers, this.friends, this.id, this.isLoggedUserAllowedPost, this.isLoggedUserFollowing, this.isLoggedUserFriend, this.isLoggedUserMember, this.link, this.members, this.picture, this.thumb, this.title, this.sports});

    factory Organization.fromJson(Map<String, dynamic> json) {
        return Organization(
            cover: json['cover'],
            description: json['description'],
            followers: json['followers'],
            friends: json['friends'],
            id: json['id'],
            isLoggedUserAllowedPost: json['isLoggedUserAllowedPost'],
            isLoggedUserFollowing: json['isLoggedUserFollowing'],
            isLoggedUserFriend: json['isLoggedUserFriend'],
            isLoggedUserMember: json['isLoggedUserMember'],
            link: json['link'],
            members: json['members'],
            picture: json['picture'],
            thumb: json['thumb'],
            title: json['title'],
            sports: json['sports'] != null ? (json['sports'] as List).map((i) => Sport.fromJson(i)).toList() : null,
        );
    }

    factory Organization.fromProfileJson(Map<String, dynamic> json) {
        return Organization(
            cover: json['profile_cover_url'],
            description: "",
            followers: json['cnt_followers'],
            friends: json['cnt_friends'],
            id: json['profile_id'],
            isLoggedUserAllowedPost: json['isLoggedUserAllowedPost'],
            isLoggedUserFollowing: json['isLoggedUserFollowing'],
            isLoggedUserFriend: json['isLoggedUserFriend'],
            isLoggedUserMember: json['isLoggedUserFollowing'],
            link: json['profile_url'],
            members: json['cnt_followers'],
            picture: json['profile_picture_url'],
            thumb: json['profile_thumb_url'],
            title: json['profile_title'],
            sports: json['sports'] != null ? (json['sports'] as List).map((i) => Sport.fromJson(i)).toList() : null,
        );
    }
}
class Sport {
    String id;
    String name;

    Sport({this.id, this.name});

    factory Sport.fromJson(Map<String, dynamic> json) {
        return Sport(
            id: json['id'].toString(),
            name: json['name'],
        );
    }
}
