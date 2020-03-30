import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:rxdart/rxdart.dart';

class CalendarCardBloc extends BaseBloc {

  final BehaviorSubject<Event> event;
  CalendarCardBloc( Event event ) : event = BehaviorSubject.seeded(event);

  @override
  void dispose() {
    event.close();
    super.dispose();
  }

  joinEvent(int actionId ) {

    bool confirm;
    if(actionId == 0)
      confirm = !event.value.isLoggedUserMember;
    else if(actionId == 1)
      confirm = !event.value.isLoggedUserIgnore;
    else
      confirm = !event.value.isLoggedUserInterested;

    httpDataClientInterface.joinEvent( event.value.id, actionId, confirm ).then((success){

      event.value.isLoggedUserMember = actionId == 0 ? confirm : false;
      event.value.isLoggedUserIgnore = actionId == 1 ? confirm : false;
      event.value.isLoggedUserInterested = actionId == 2 ? confirm : false;
      event.value = event.value;

    }).catchError((err){
      showError(err.toString());
    });
  }
}