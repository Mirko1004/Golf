class ProfileViewShort {
    String cnt_followers;
    String cnt_following;
    String cnt_friends;
    bool isLoggedUserFollowing;
    bool isLoggedUserFriend;
    bool isLoggedUserFriendRequestPending;
    bool is_active;
    bool is_online;
    String profile_id;
    String profile_module;
    String profile_thumb_url;
    String profile_title;

    ProfileViewShort({this.cnt_followers, this.cnt_following, this.cnt_friends, this.isLoggedUserFollowing, this.isLoggedUserFriend, this.isLoggedUserFriendRequestPending, this.is_active, this.is_online, this.profile_id, this.profile_module, this.profile_thumb_url, this.profile_title});

    factory ProfileViewShort.fromJson(Map<String, dynamic> json) {
        return ProfileViewShort(
            cnt_followers: json['cnt_followers'],
            cnt_following: json['cnt_following'],
            cnt_friends: json['cnt_friends'],
            isLoggedUserFollowing: json['isLoggedUserFollowing'],
            isLoggedUserFriend: json['isLoggedUserFriend'],
            isLoggedUserFriendRequestPending: json['isLoggedUserFriendRequestPending'],
            is_active: json['is_active'],
            is_online: json['is_online'],
            profile_id: json['profile_id'],
            profile_module: json['profile_module'],
            profile_thumb_url: json['profile_thumb_url'],
            profile_title: json['profile_title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cnt_followers'] = this.cnt_followers;
        data['cnt_following'] = this.cnt_following;
        data['cnt_friends'] = this.cnt_friends;
        data['isLoggedUserFollowing'] = this.isLoggedUserFollowing;
        data['isLoggedUserFriend'] = this.isLoggedUserFriend;
        data['isLoggedUserFriendRequestPending'] = this.isLoggedUserFriendRequestPending;
        data['is_active'] = this.is_active;
        data['is_online'] = this.is_online;
        data['profile_id'] = this.profile_id;
        data['profile_module'] = this.profile_module;
        data['profile_thumb_url'] = this.profile_thumb_url;
        data['profile_title'] = this.profile_title;
        return data;
    }
}