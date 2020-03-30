import 'package:golf/bloc/base_bloc.dart';

class HomeBloc extends BaseBloc {

  initDataCache() {
    dataCache.initDataCache().catchError((err) => showError(err.toString()));
  }
}