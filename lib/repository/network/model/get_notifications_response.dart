class GetNotificationsResponse {

  List<SysNotification> notifications;
  bool loadMore;

  GetNotificationsResponse({this.notifications, this.loadMore});

  factory GetNotificationsResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationsResponse(
      notifications: json["data"] != null ? (json["data"] as List).map((i) => SysNotification.fromJson(i)).toList() : null,
      loadMore: json['load_more'],
    );
  }
}



class SysNotification{

  String actionType;
  String actionOwnerId;
  String actionOwnerName;
  String actionOwnerThumb;
  String actionDesc;
  String objectId;
  String objectType;
  String objectName;
  String commentId;
  String bxTimelineEventId;
  String date;
  String contentParsed;


  SysNotification({this.actionType, this.actionOwnerId, this.actionOwnerName, this.actionOwnerThumb, this.actionDesc, this.objectId, this.objectType,
    this.objectName, this.commentId,this.bxTimelineEventId, this.date, this.contentParsed});

  factory SysNotification.fromJson(Map<String, dynamic> json) {
    return SysNotification(
      actionType: json['action_type'],
      actionOwnerId: json['action_owner_id'],
      actionOwnerName: json['action_owner_name'],
      actionOwnerThumb: json['action_owner_thumb'],
      actionDesc: json['action_desc'],
      objectId: json['object_id'],
      objectType: json['object_type'],
      objectName: json['object_name'],
      commentId: json['somment_id'],
      bxTimelineEventId: json['bx_timeline_event_id'],
      date: json['date'],
      contentParsed: json['content_parsed'],
    );
  }

}