
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

String postedAgoString( int utcTime ) {

  DateTime postDatetime = DateTime.fromMillisecondsSinceEpoch(utcTime*1000);
  DateTime now = DateTime.now().toUtc();
  Duration dd = now.difference(postDatetime);
  final seconds = dd.inSeconds;
  final minutes = dd.inMinutes;
  final hours = dd.inHours;
  final days = dd.inDays;

  String postAgoText = "";
  String timeUnit = "";
  if (days > 0){
    postAgoText = days.toString();
    timeUnit = "days";
  }
  else if (hours > 0){
    postAgoText = hours.toString();
    timeUnit = "hours";
  }
  else if (minutes > 0){
    postAgoText = minutes.toString();
    timeUnit = "minutes";
  }
  else  {
    postAgoText = seconds.toString();
    timeUnit = "seconds";
  }

  return "$postAgoText $timeUnit ago";
}