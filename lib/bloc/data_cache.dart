import 'dart:async';
import 'dart:io';

import 'package:golf/bloc/session.dart';
import 'package:golf/repository/network/http_client_interface.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/repository/network/model/get_notifications_response.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:golf/repository/network/model/get_timeline_posts_response.dart';
import 'package:golf/repository/preferences/preferences_interface.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class DataCache {

  final int postsPerPage = 24;

  final HttpDataClientInterface _httpClient;
  final PreferencesInterface _preferencesInterface;
  final Session _session;

  //Home bottom bar page
  final BehaviorSubject<int> currentPage = BehaviorSubject<int>.seeded( 0 );

  //Community page
  final BehaviorSubject<int> communityCurrentPage = BehaviorSubject<int>.seeded( 0 );

  //Home timeline
  final BehaviorSubject<bool> loadMorePosts = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<TimelinePost>> timelinePosts = BehaviorSubject.seeded(List());

  //Channel timeline
  final BehaviorSubject<bool> loadMoreChannelPosts = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<TimelinePost>> channelTimelinePosts = BehaviorSubject.seeded(List());

  //Events
  final BehaviorSubject<bool> loadMoreEvents = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<Event>> events = BehaviorSubject.seeded(List());

  //Organizations
  final BehaviorSubject<bool> loadMoreOrganizations = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<Organization>> organizations = BehaviorSubject.seeded(List<Organization>());

  //Notifications
  final BehaviorSubject<bool> loadMoreNotifications = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<SysNotification>> notifications = BehaviorSubject.seeded(List());
  final BehaviorSubject<int> notificationsNewCount = BehaviorSubject.seeded(0);

  DataCache(this._preferencesInterface, this._session, this._httpClient);

  dispose() async {
    communityCurrentPage.close();
    currentPage.close();
    loadMorePosts.close();
    timelinePosts.close();
    loadMoreChannelPosts.close();
    channelTimelinePosts.close();
    loadMoreEvents.close();
    events.close();
    loadMoreOrganizations.close();
    organizations.close();
    loadMoreNotifications.close();
    notifications.close();
    notificationsNewCount.close();
  }

  //Called only from HomeBloc to get the main data.
  Future initDataCache() async {
    getTimelinePosts(false);
    getHighlightsPosts(false);
    getEvents(false);
    getOrganizations(false);
    getNewNotificationCount();
    getNotifications(false);
  }

  getTimelinePosts(bool loadMore) async {
    try {
      int start = 0;
      if(loadMore){
        start = timelinePosts.value.length;
      } else {
        loadMorePosts.value = false;
        //timelinePosts.value = List();
      }

      TimelineData timelineResponseServer = await _httpClient.getTimelinePosts(start, postsPerPage);
      if(loadMore)
      timelinePosts.value = timelinePosts.value..addAll(timelineResponseServer.timelinePosts);
      else
        timelinePosts.value = timelineResponseServer.timelinePosts;
      loadMorePosts.value = timelineResponseServer.loadMore;

    } catch(err){
      throw err;
    }
  }

  getHighlightsPosts(bool loadMore) async {
    try {
      int start = 0;
      if(loadMore){
        start = channelTimelinePosts.value.length;
      } else {
        loadMoreChannelPosts.value = false;
        //channelTimelinePosts.value = List();
      }

      TimelineData timelineResponseServer = await _httpClient.getHighlightsTimelinePosts(start, postsPerPage);
      if(loadMore)
        channelTimelinePosts.value = channelTimelinePosts.value..addAll(timelineResponseServer.timelinePosts);
      else
        channelTimelinePosts.value = timelineResponseServer.timelinePosts;
      loadMoreChannelPosts.value = timelineResponseServer.loadMore;

    } catch(err){
      throw err;
    }
  }

  getEvents(bool loadMore) async {

    DateTime currentDate = DateTime.now();

    DateTime startDate = DateTime.utc(currentDate.year, currentDate.month, currentDate.day, 0, 0, 0);
    DateTime endDate = DateTime.utc(currentDate.year, currentDate.month, currentDate.day, 23, 59, 59).add(Duration(days: 7 - currentDate.weekday));

    String startDateString = DateFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'+00:00'").format(startDate);
    String endDateString = DateFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'+00:00'").format(endDate);

    try {
      GetAllEventsResponse getAllEventsResponse = await _httpClient.getEventsTillWeekEnd(startDateString, endDateString, 0, postsPerPage);
      if(loadMore)
      events.value = events.value..addAll(getAllEventsResponse.events);
      else
        events.value = getAllEventsResponse.events;

      loadMoreEvents.value = getAllEventsResponse.loadMore;
    } catch(err){
      throw err;
    }
  }

  getOrganizations(bool loadMore) async {
    try {
      int start = 0;
      if(loadMore){
        start = organizations.value.length;
      } else {
        loadMoreOrganizations.value = false;
      }

      GetOrgsResponse getAllOrgsResponse = await _httpClient.getOrganizations(start, postsPerPage);
      if(loadMore)
        organizations.value = organizations.value..addAll(getAllOrgsResponse.organizationList);
      else
        organizations.value = getAllOrgsResponse.organizationList;

      loadMoreOrganizations.value = getAllOrgsResponse.loadMore;

    } catch(err){
      throw err;
    }
  }

  getNotifications(bool loadMore) async {
    try {
      int start = 0;
      if(loadMore){
        start = notifications.value.length;
      } else {
        loadMoreNotifications.value = false;
      }

      GetNotificationsResponse getNotificationsResponse = await _httpClient.getAllNotifications(start, postsPerPage);
      if(loadMore)
        notifications.value = notifications.value..addAll(getNotificationsResponse.notifications);
      else
        notifications.value = getNotificationsResponse.notifications;

      loadMoreNotifications.value = getNotificationsResponse.loadMore;

    } catch(err){
      throw err;
    }
  }

  getNewNotificationCount() async {

    try {
      notificationsNewCount.value = await _httpClient.getNewNotificationCount();
    } catch(err){
      throw err;
    }
  }

  registerFcmToken(String fcmToken) async {
    try {

      int deviceType = 0;
      if(Platform.isIOS)
        deviceType = 1;

      _httpClient.registerFCMToken(deviceType, fcmToken);

    } catch(err){
      print("error sending token: " + err.toString());
    }
  }
}
