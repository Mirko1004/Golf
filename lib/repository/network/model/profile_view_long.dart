class ProfileViewLong {
    String cnt_followers;
    String cnt_following;
    String cnt_friends;
    String cnt_posts;
    String cnt_timeline_event_posts;
    bool isLoggedUserAllowedPost;
    bool isLoggedUserFollowing;
    bool isLoggedUserFriend;
    bool isLoggedUserFriendRequestPending;
    bool is_active;
    bool is_online;
    MembershipLvl membership_lvl;
    String profile_avatar_url;
    String profile_cover_url;
    ProfileData profile_data;
    bool profile_has_picture;
    String profile_icon_url;
    String profile_id;
    ProfileInfo profile_info;
    String profile_module;
    String profile_picture_url;
    String profile_thumb_url;
    String profile_title;
    String profile_url;
    String profile_views;
    List<UserOrganization> userOrganizations;
    List<Sport> sports;

    ProfileViewLong({this.cnt_followers, this.cnt_following, this.cnt_friends, this.cnt_posts, this.cnt_timeline_event_posts, this.isLoggedUserAllowedPost,
        this.isLoggedUserFollowing, this.isLoggedUserFriend, this.isLoggedUserFriendRequestPending, this.is_active, this.is_online, this.membership_lvl,
        this.profile_avatar_url, this.profile_cover_url, this.profile_data, this.profile_has_picture, this.profile_icon_url, this.profile_id, this.profile_info,
        this.profile_module, this.profile_picture_url, this.profile_thumb_url, this.profile_title, this.profile_url, this.profile_views, this.userOrganizations, this.sports});

    factory ProfileViewLong.fromJson(Map<String, dynamic> json) {
        return ProfileViewLong(
            cnt_followers: json['cnt_followers'],
            cnt_following: json['cnt_following'],
            cnt_friends: json['cnt_friends'],
            cnt_posts: json['cnt_posts'],
            cnt_timeline_event_posts: json['cnt_timeline_event_posts'],
            isLoggedUserAllowedPost: json['isLoggedUserAllowedPost'],
            isLoggedUserFollowing: json['isLoggedUserFollowing'],
            isLoggedUserFriend: json['isLoggedUserFriend'],
            isLoggedUserFriendRequestPending: json['isLoggedUserFriendRequestPending'],
            is_active: json['is_active'],
            is_online: json['is_online'],
            membership_lvl: json['membership_lvl'] != null ? MembershipLvl.fromJson(json['membership_lvl']) : null,
            profile_avatar_url: json['profile_avatar_url'],
            profile_cover_url: json['profile_cover_url'],
            profile_data: json['profile_data'] != null ? ProfileData.fromJson(json['profile_data']) : null,
            profile_has_picture: json['profile_has_picture'],
            profile_icon_url: json['profile_icon_url'],
            profile_id: json['profile_id'] is String ? json['profile_id'] : json['profile_id'].toString(),
            profile_info: json['profile_info'] != null ? ProfileInfo.fromJson(json['profile_info']) : null,
            profile_module: json['profile_module'],
            profile_picture_url: json['profile_picture_url'],
            profile_thumb_url: json['profile_thumb_url'],
            profile_title: json['profile_title'],
            profile_url: json['profile_url'],
            profile_views: json['profile_views'],
            userOrganizations: json['organizations'] != null ? (json['organizations'] as List).map((i) => UserOrganization.fromJson(i)).toList() : null,
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

class UserOrganization {
    String orgId;
    String orgName;

    UserOrganization({this.orgId, this.orgName});

    factory UserOrganization.fromJson(Map<String, dynamic> json) {
        return UserOrganization(
            orgId: json['org_id'],
            orgName: json['org_name'],
        );
    }
}

class MembershipLvl {
    String date_expires;
    String date_starts;
    String id;
    String name;
    String quota_max_file_size;
    String quota_number;
    String quota_size;
    String status;
    String transaction_id;

    MembershipLvl({this.date_expires, this.date_starts, this.id, this.name, this.quota_max_file_size, this.quota_number, this.quota_size, this.status, this.transaction_id});

    factory MembershipLvl.fromJson(Map<String, dynamic> json) {
        return MembershipLvl(
            date_expires: json['date_expires'],
            date_starts: json['date_starts'],
            id: json['id'],
            name: json['name'],
            quota_max_file_size: json['quota_max_file_size'],
            quota_number: json['quota_number'],
            quota_size: json['quota_size'],
            status: json['status'],
            transaction_id: json['transaction_id'],
        );
    }
}

class ProfileInfo {
    String account_id;
    String content_id;
    String id;
    String status;
    String type;

    ProfileInfo({this.account_id, this.content_id, this.id, this.status, this.type});

    factory ProfileInfo.fromJson(Map<String, dynamic> json) {
        return ProfileInfo(
            account_id: json['account_id'],
            content_id: json['content_id'],
            id: json['id'],
            status: json['status'],
            type: json['type'],
        );
    }
}

class ProfileData {
    String account_id;
    String added;
    String allow_post_to;
    String allow_view_to;
    String author;
    String birthday;
    String changed;
    String comments;
    String cover;
    String description;
    String favorites;
    String featured;
    String first_name;
    String fullname;
    String gender;
    String id;
    String last_name;
    String is_member;
    String picture;
    String profile_email;
    String profile_id;
    String profile_ip;
    String profile_status;
    String rate;
    String reports;
    String sc_down;
    String sc_up;
    String score;
    String views;
    String votes;

    ProfileData({this.account_id, this.added, this.allow_post_to, this.allow_view_to, this.author, this.birthday, this.changed, this.comments, this.cover, this.description, this.favorites, this.featured, this.first_name, this.fullname, this.gender, this.id, this.last_name, this.is_member, this.picture, this.profile_email, this.profile_id, this.profile_ip, this.profile_status, this.rate, this.reports, this.sc_down, this.sc_up, this.score, this.views, this.votes});

    factory ProfileData.fromJson(Map<String, dynamic> json) {
        return ProfileData(
            account_id: json['account_id'],
            added: json['added'],
            allow_post_to: json['allow_post_to'],
            allow_view_to: json['allow_view_to'],
            author: json['author'],
            birthday: json['birthday'],
            changed: json['changed'],
            comments: json['comments'],
            cover: json['cover'],
            description: json['description'],
            favorites: json['favorites'],
            featured: json['featured'],
            first_name: json['first_name'],
            fullname: json['fullname'],
            gender: json['gender'],
            id: json['id'],
            last_name: json['last_name'],
            is_member: json['is_member'] ,
            picture: json['picture'],
            profile_email: json['profile_email'],
            profile_id: json['profile_id'],
            profile_ip: json['profile_ip'],
            profile_status: json['profile_status'],
            rate: json['rate'],
            reports: json['reports'],
            sc_down: json['sc_down'],
            sc_up: json['sc_up'],
            score: json['score'],
            views: json['views'],
            votes: json['votes'],
        );
    }
}