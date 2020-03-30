import 'package:golf/repository/network/model/profile_view_long.dart';

class GetOrganizationMembersResponse {
    List<ProfileViewLong> profileViewLongList;
    int actualRowsLoaded;
    bool loadMore;

    GetOrganizationMembersResponse({this.profileViewLongList, this.actualRowsLoaded, this.loadMore});

    factory GetOrganizationMembersResponse.fromJson(Map<String, dynamic> json) {
        return GetOrganizationMembersResponse(
          profileViewLongList: json['data'] != null ? (json['data'] as List).map((i) => ProfileViewLong.fromJson(i)).toList() : null,
            actualRowsLoaded: json['actual_rows_loaded'],
            loadMore: json['load_more'],
        );
    }
}
