import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:golf/bloc/session.dart';
import 'package:golf/repository/network/dio_interceptor.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/repository/network/model/get_comments_response.dart';
import 'package:golf/repository/network/model/get_notifications_response.dart';
import 'package:golf/repository/network/model/get_org_members.dart';
import 'package:golf/repository/network/model/get_pending_friend_request_response.dart';
import 'package:golf/repository/network/model/get_timeline_posts_response.dart';
import 'package:golf/repository/network/model/get_vote_persons.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';
import 'package:golf/repository/network/model/profile_view_short.dart';
import 'package:golf/repository/network/model/upload_file_response.dart';
import 'package:uuid/uuid.dart';

import 'model/get_orgs_response.dart';

  class HttpDataClientInterface {

  final Session session;
  Dio dio;

  HttpDataClientInterface(this.session) {
    BaseOptions options = BaseOptions(
      baseUrl: URL,
      connectTimeout: 5000,
      receiveTimeout: 50000,
    );
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true,));
    dio.interceptors.add(DioInterceptor(this));
  }

  Future<bool> login(String username, String password) async => session.login(username, password);
  Future<bool> signup(String username, String password) async => session.signup(username, password);
  Future<bool> loginGoogle( String idToken, String email, bool isLogin ) async => session.loginSignupGoogle(idToken, email, isLogin );
  Future<bool> loginFacebook( String idToken, String email, bool isLogin ) async => session.loginFacebook(idToken, email, isLogin );
  Future<bool> loginLinkedin( String idToken, String email, bool isLogin ) async => session.loginLinkedin(idToken, email, isLogin );

  Future<ProfileViewShort> getProfileShort() async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "view_profile_short",
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return ProfileViewShort.fromJson(response.data.result);
  }

  Future<ProfileViewLong> getProfile(String profileId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "view_profile",
      "id": profileId
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return ProfileViewLong.fromJson(response.data.result);
  }

  Future<ProfileViewLong> updateProfile(bool isMale, String firstName, String lastName, String bio, File image, List<int> sportIds) async {

    FileUploadResponse fileUploadResponse;
    if(image != null) {
      fileUploadResponse = await uploadProfileImage(session.profileId, image);
    }

    Map<String, dynamic> formData = {
      "gender": isMale ? 1: 2,
      "fullname": "$firstName $lastName",
      "first_name": firstName,
      "last_name": lastName,
      "allow_view_to": 3,
      "allow_post_to": 5,
      "do_submit": "submit",
      "description": bio,
    };

    if(fileUploadResponse != null)
      formData.putIfAbsent("picture[0]", () => fileUploadResponse.fileId );

    int counter = 0;
    if(sportIds != null) {
      sportIds.forEach((sportId){
        formData.putIfAbsent("person_sports[$counter]", () => sportId );
        counter++;
      });
    }

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "edit_profile",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);

    return await getProfile(session.profileId);
  }

  Future<FileUploadResponse> uploadProfileImage(String profileId, File image) async {

    Uuid uuid = Uuid();
    String uuidString = uuid.v4();

    FormData formData = new FormData.fromMap({
      "id": profileId,
      "f": await MultipartFile.fromFile(image.path),
      "uploader_uid": uuidString,
    });

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "upload_profile_photo",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: formData);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return FileUploadResponseNew.fromJson(UploadFileType.IMAGE, response.data.result).uploadedItems.firstWhere( (result) => result.uploaderUid == uuidString);
  }

//  Future<int> uploadPostLink(String url) async {
//
//    String uuidString = session.profileId;
//
//    FormData formData = new FormData.fromMap({
//      "url": url,
//    });
//
//    final queryParams = {
//      "module": "bx_digi_nom",
//      "method": "submit_post_link",
//    };
//
//    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: formData);
//
//    if (response.data.error)
//      throw Exception(response.data.error_text);
//
//    return FileUploadResponseNew.fromJson(true, response.data.result).uploadedItems.where( (result) => result.uploaderUid == uuidString).toList();
//  }
//
  Future<FileUploadResponse> uploadPostImageWithUUID(String uuid, File image) async {

    FormData formData = new FormData.fromMap({
      "f": await MultipartFile.fromFile(image.path),
      "uploader_uid": uuid,
    });

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "upload_timeline_photo",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: formData);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return FileUploadResponseNew.fromJson(UploadFileType.IMAGE, response.data.result).uploadedItems.firstWhere( (result) => result.uploaderUid == uuid);
  }

  Future<List<FileUploadResponse>> uploadPostImage(File image) async {

    String uuidString = session.profileId;

    FormData formData = new FormData.fromMap({
      "f": await MultipartFile.fromFile(image.path),
      "uploader_uid": uuidString,
    });

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "upload_timeline_photo",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: formData);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return FileUploadResponseNew.fromJson(UploadFileType.IMAGE, response.data.result).uploadedItems.where( (result) => result.uploaderUid == uuidString).toList();
  }

  Future<FileUploadResponse> uploadPostVideoWithUUID(String uuid, File video) async {

    FormData formData = new FormData.fromMap({
      "f": await MultipartFile.fromFile(video.path),
      "uploader_uid": uuid,
    });

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "upload_timeline_video",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: formData);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return FileUploadResponseNew.fromJson(UploadFileType.VIDEO, response.data.result).uploadedItems.firstWhere( (result) => result.uploaderUid == uuid);
  }

  Future<GetVideoDataResponse> getPostVideoData(String videoId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_video_data",
      "file_id": videoId,
      "file_type": "2",
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetVideoDataResponse.fromJson(response.data.result);
  }

  Future<List<FileUploadResponse>> uploadPostVideo(File video) async {

    String uuidString = session.profileId;

    FormData formData = new FormData.fromMap({
      "f": await MultipartFile.fromFile(video.path),
      "uploader_uid": uuidString,
    });

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "upload_timeline_video",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: formData);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return FileUploadResponseNew.fromJson(UploadFileType.VIDEO, response.data.result).uploadedItems.where( (result) => result.uploaderUid == uuidString).toList();
  }

  Future<bool> deleteImageOrphans() async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_orphan_file",
      "file_type": 1,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> deleteVideoOrphans() async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_orphan_file",
      "file_type": 2,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> deletePostImage(String imageId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_orphan_file",
      "file_type": 1,
      "id": imageId,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> deletePostImageByUUID(String imageUUID) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_orphan_file",
      "file_type": 1,
      "uploader_uid": imageUUID,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> deletePostVideo(String videoId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_orphan_file",
      "file_type": 2,
      "id": videoId,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> deletePostVideoByUUID(String videoUUID) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_orphan_file",
      "file_type": 2,
      "uploader_uid": videoUUID,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool>  timelineVideosTranscodeStatus(List<String> videoIds) async {

    List<bool> statuses = List();
    for(var videoId in videoIds){
      statuses.add(await timelineVideoTranscodeStatus(videoId));
    }

    return !statuses.contains(false);
  }

  Future<bool> timelineVideoTranscodeStatus(String videoId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "is_video_transcoded",
      "file_type": 2,
      "file_id": videoId,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return response.data.result["is_transcoded"];
  }

  Future<bool> postSubmit(String postText, List<String> images, List<String> videos, List<String> links) async {

    Map<String, dynamic> formData = {
      "owner_id": 0,
      "text": postText,
    };

    int uploadIndex = 0;
    images.forEach((fileId){
      formData.putIfAbsent( "photo[$uploadIndex]", () => fileId );
      uploadIndex++;
    });

    int videoUploadIndex = 0;
    videos.forEach((fileId){
      formData.putIfAbsent( "video[$videoUploadIndex]", () => fileId );
      videoUploadIndex++;
    });

    int urlUploadIndex = 0;
    links.forEach((url){
      formData.putIfAbsent( "urls[$urlUploadIndex]", () => url );
      urlUploadIndex++;
    });

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "submit_timeline_post",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> postEdit(String postId, String postText) async {

    Map<String, dynamic> formData = {
      "id": postId,
      "owner_id": 0,
      "text": postText,
      "type": "timeline_common_post",
      "location_lat": "",
      "location_lng": "",
      "location_country": "",
      "location_state": "",
      "location_city": "",
      "location_zip": "",
      "location_street": "",
      "location_street_number": "",
    };

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "edit_timeline_post",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<GetOrgsResponse> getOrganizations(int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_orgs",
      "sort": "recent",
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetOrgsResponse.fromJson(response.data.result);
  }

  Future<GetOrgsResponse> searchOrganizations(String searchString, int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "search_orgs",
      "keyword": searchString,
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetOrgsResponse.fromJson(response.data.result);
  }

  Future<GetOrganizationMembersResponse> searchOrganizationMembers(String searchString, String organizationId, bool getStaff, int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "search_persons",
      "keyword": searchString,
      "person_org_id": organizationId,
      "show_only_staff": getStaff ? 1 : 0,
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetOrganizationMembersResponse.fromJson(response.data.result);
  }

  Future<GetOrganizationMembersResponse> getOrganizationMembers(String organizationId, bool getStaff, bool skipLoggedUser, int start, int perPage ) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_org_members",
      "id": organizationId,
      "show_only_staff": getStaff ? 1 : 0,
      "skip_logged_user": skipLoggedUser ? 1 : 0,
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetOrganizationMembersResponse.fromJson(response.data.result);
  }

  Future<bool> joinLeaveOrganization(String organizationId, bool join) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "join_organization",
    };

    Map<String, dynamic> formData = {
      "id": organizationId,
      "join": join ? 1 : 0,
      "skip_email_notification": 1,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);
    else
      return true;
  }

  Future<bool> follow(String profileId, bool join) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "follow",
    };

    Map<String, dynamic> formData = {
      "id": profileId,
      "follow": join ? 1 : 0,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);
    else
      return true;
  }

  Future<bool> vote(String postId, bool love, String system) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "vote",
    };

    Map<String, dynamic> formData = {
      "id": postId,
      "system": system,
      "reaction": "love",
      "value": love ? 1 : 0,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);
    else
      return true;
  }

  Future<GetVotePersons> getVotePersons(String contentVoteId, String contentVoteSystem, int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_persons_vote",
      "start": start,
      "per_page": perPage,
      "id": contentVoteId,
      "system": contentVoteSystem,
      "reaction": "love",
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetVotePersons.fromJson(response.data.result);
  }

  Future<bool> postComment( String postId, String system, String parentId, String commentText ) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "submit_comment",
    };

    Map<String, dynamic> formData = {
      "id": postId,
      "system": system,
      "cmt_parent_id": parentId,
      "cmt_text": commentText,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);
    else
      return true;
  }

  Future<TimelineData> getTimelinePosts(int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_timeline_posts",
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return TimelineData.fromJson(response.data.result);
  }

  Future<TimelinePost> getOneTimelinePosts(String postId, String ownerId ) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_one_timeline_post",
      "id": postId,
    };

    if (ownerId != null && ownerId.isNotEmpty )
      queryParams.putIfAbsent("owner_id", () => ownerId );

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return TimelinePost.fromJson(response.data.result);
  }

  Future<TimelineData> getHighlightsTimelinePosts(int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_timeline_posts",
      "owner_id": "3",
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return TimelineData.fromJson(response.data.result);
  }

  Future<TimelinePost> getTimelinePost(String postId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_one_timeline_post",
      "id": postId,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return TimelinePost.fromJson(response.data.result);
  }

  Future<bool> deleteTimelinePost(String postId, String ownerId) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "delete_timeline_post",
    };

    Map<String, dynamic> formData = {
      "id": postId,
      "owner_id": ownerId,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);
    else
      return true;
  }

  Future<GetCommentResponse> getComments(String postId, String systemType, int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_comments",
      "id": postId,
      "system": systemType,
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetCommentResponse.fromJson(response.data.result);
  }

  Future<GetAllEventsResponse> getEvents(int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_events",
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetAllEventsResponse.fromJson(response.data.result);
  }

  Future<GetAllEventsResponse> getEventsTillWeekEnd(String startDate, String endDate, int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_events",
      "start": start,
      "per_page": perPage,
      "date_start_utc": startDate,
      "date_end_utc": endDate,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetAllEventsResponse.fromJson(response.data.result);
  }

  Future<bool> joinEvent(String eventId, int actionId, bool confirm ) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "join_event",
    };

    String action;
    if(actionId == 0)
      action = "join";
    else if(actionId == 1)
      action = "ignore";
    else
      action = "interested";

    Map<String, dynamic> formData = {
      "id": eventId,
      "action": action,
      "value": confirm ? 1 : 0,
      "skip_email_notification": 1,
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);
    else
      return true;
  }

  Future<int> getNewNotificationCount() async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_new_notifications_count",
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return response.data.result["cnt_new_notifications"];
  }

  Future<GetNotificationsResponse> getNewNotifications(int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_new_notifications",
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetNotificationsResponse.fromJson(response.data.result);
  }

  Future<GetNotificationsResponse> getAllNotifications(int start, int perPage) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "get_notifications",
      "start": start,
      "per_page": perPage,
    };

    Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    return GetNotificationsResponse.fromJson(response.data.result);
  }

  Future<bool> markNotificationsRead() async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "set_notification_as_read",
    };

    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return true;
  }

  Future<bool> registerFCMToken( int deviceType, String fcmToken ) async {

    final queryParams = {
      "module": "bx_digi_nom",
      "method": "register_mobile_device",
    };

    Map<String, dynamic> formData = {
      "type": deviceType,
      "device_id": fcmToken,
    };


    Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData) );

    if (response.data.error)
      throw Exception(response.data.errorText);

    return response.data.result["cnt_new_notifications"];
  }

    Future<GetPendingFriendRequestsResponse> getPendingFriendRequests(int start, int perPage) async {

      final queryParams = {
        "module": "bx_digi_nom",
        "method": "get_person_friends",
        "start": start,
        "per_page": perPage,
        "type": "pending_friend_requests",
      };

      Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

      if (response.data.error)
        throw Exception(response.data.errorText);

      return GetPendingFriendRequestsResponse.fromJson(response.data.result);
    }

    Future<bool> friend(String profileId, bool join) async {

      final queryParams = {
        "module": "bx_digi_nom",
        "method": "friend",
      };

      Map<String, dynamic> formData = {
        "id": profileId,
        "friend": join ? 1 : 0,
      };

      Response response = await dio.post("/m/oauth2/api/service", queryParameters: queryParams, data: FormData.fromMap(formData));

      if (response.data.error)
        throw Exception(response.data.errorText);
      else
        return true;
    }

    Future<bool> getSetAsViewed(String contentId,String contentSystem) async {

      final queryParams = {
        "module": "bx_digi_nom",
        "method": "set_as_viewed",
        "id": contentId,
        "system": contentSystem,
      };

      Response response = await dio.get("/m/oauth2/api/service", queryParameters: queryParams);

      if (response.data.error)
        throw Exception(response.data.errorText);

      return true;
    }


  }
