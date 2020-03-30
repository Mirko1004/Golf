import 'package:golf/repository/network/model/profile_view_short.dart';

class GetPendingFriendRequestsResponse {
  List<ProfileViewShort> profileViewShortList;
  int actualRowsLoaded;
  bool loadMore;

  GetPendingFriendRequestsResponse({this.profileViewShortList, this.actualRowsLoaded, this.loadMore});

  factory GetPendingFriendRequestsResponse.fromJson(Map<String, dynamic> json) {
    return GetPendingFriendRequestsResponse(
      profileViewShortList: json['data'] != null ? (json['data'] as List).map((i) => ProfileViewShort.fromJson(i)).toList() : null,
      actualRowsLoaded: json['actual_rows_loaded'],
      loadMore: json['load_more'],
    );
  }
}
