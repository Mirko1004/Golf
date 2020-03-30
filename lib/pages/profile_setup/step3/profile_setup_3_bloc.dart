import 'package:golf/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ProfileSetup3Bloc extends BaseBloc {

  final BehaviorSubject<List<int>> sportsList = BehaviorSubject.seeded(List());

  @override
  void dispose() {
    sportsList.close();
    super.dispose();
  }

  addRemoveSport(int sportId) {
    if ( sportsList.value.contains(sportId) )
      sportsList.value.remove(sportId);
    else
      sportsList.value.add(sportId);

    sportsList.value = sportsList.value;
  }

}