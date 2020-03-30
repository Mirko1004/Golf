import 'package:golf/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class InterestsBloc extends BaseBloc {

  final BehaviorSubject<List<int>> interestsList = BehaviorSubject.seeded(List());

  @override
  void dispose() {
    interestsList.close();
    super.dispose();
  }

  addRemoveInterests(int interestsId) {
    if ( interestsList.value.contains(interestsId) )
      interestsList.value.remove(interestsId);
    else
      interestsList.value.add(interestsId);

    interestsList.value = interestsList.value;
  }

}