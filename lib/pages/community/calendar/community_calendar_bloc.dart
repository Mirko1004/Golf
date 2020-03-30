import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class CommunityCalendarBloc extends BaseBloc {

  static Map<DateTime, List<Event>> getEmptyMap(DateTime currentDate) {

    var keyList = List<DateTime>.generate( 8 - currentDate.weekday, (i) => currentDate.add( Duration(days: i) ) );
    return Map.fromIterable(keyList, key: (key) => key, value: (key) => List());
  }

  final BehaviorSubject<DateTime> currentDate = BehaviorSubject.seeded(DateTime.now());

  //Events map
  final BehaviorSubject<bool> loadMoreEvents = BehaviorSubject.seeded(false);
  final BehaviorSubject<Map<DateTime, List<Event>>> eventsMap = BehaviorSubject.seeded(getEmptyMap(DateTime.now()));

  CommunityCalendarBloc() {
    getEvents(false);
    currentDate.listen((currentDate){
      getEvents(false);
    });
  }

  @override
  void dispose() {
    currentDate.close();
    eventsMap.close();
    loadMoreEvents.close();
    super.dispose();
  }

  setCurrentDate(DateTime currentDate){
    if(this.currentDate.value.year == currentDate.year && this.currentDate.value.month == currentDate.month && this.currentDate.value.day == currentDate.day)
      return;

    this.currentDate.value = currentDate;
  }

  getEvents(bool loadMore) async {

    try {
      if(loadMore){
      } else {
        loadMoreEvents.value = false;
        eventsMap.value = getEmptyMap(currentDate.value);
      }

      DateTime startDate = DateTime.utc(currentDate.value.year, currentDate.value.month, currentDate.value.day, 0, 0, 0);
      DateTime endDate = DateTime.utc(currentDate.value.year, currentDate.value.month, currentDate.value.day, 23, 59, 59).add(Duration(days: 7 - currentDate.value.weekday));

      String startDateString = DateFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'+00:00'").format(startDate);
      String endDateString = DateFormat("yyyy'-'MM'-'dd'T'HH':'mm':'ss'+00:00'").format(endDate);

      httpDataClientInterface.getEventsTillWeekEnd(startDateString, endDateString, 0, dataCache.postsPerPage).then((getAllEventsResponse){

        loadMoreEvents.value = getAllEventsResponse.loadMore;
        _addEvents(getAllEventsResponse.events);

      }).catchError((err){
        showError(err.toString());
      });
    } catch(err){
      throw err;
    }
  }

  _addEvents( List<Event> events ) {

    if(events == null )
      return;

    events.forEach((event){
      DateTime eventStartDatetime = DateTime.fromMillisecondsSinceEpoch(int.parse(event.dateStart)*1000);
      DateTime mapKey = eventsMap.value.keys.firstWhere((date) => date.year == eventStartDatetime.year && date.month == eventStartDatetime.month && date.day == eventStartDatetime.day);
      eventsMap.value[mapKey].add(event);
    });

    eventsMap.value = eventsMap.value;
  }

}
