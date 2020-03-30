import 'dart:async';

import 'package:golf/bloc/session.dart';
import 'package:golf/di/inject.dart';
import 'package:golf/repository/network/http_client_interface.dart';
import 'package:rxdart/rxdart.dart';

import 'data_cache.dart';

abstract class BaseBloc {

  final Session session = Injection.injector.get<Session>();
  final DataCache dataCache = Injection.injector.get<DataCache>();
  final HttpDataClientInterface httpDataClientInterface = Injection.injector.get<HttpDataClientInterface>();

  final BehaviorSubject<bool> _progressVisible = BehaviorSubject<bool>.seeded( false );
  final BehaviorSubject<String> _error = BehaviorSubject<String>.seeded( "" );
  final BehaviorSubject<String> _toast = BehaviorSubject<String>.seeded( "" );

  showError(String error) {
    if(!_error.isClosed)
      _error.sink.add(error);
  }
  Stream<String> get errorStream => _error.stream;

  showProgress(bool show) {
    if(!_progressVisible.isClosed)
      _progressVisible.sink.add(show);
  }
  Stream<bool> get progressVisible => _progressVisible.stream;

  bool isProgressVisible() => _progressVisible.value;

  showToast(String text) {
    if(!_toast.isClosed)
      _toast.sink.add(text);
  }
  Stream<String> get toastStream => _toast.stream;

//  Future<dynamic> httpCallHandler<T>(FutureFunc call) async {
//    showProgress(true);
//    try{
//      return await call();
//    }
//    on TokenExpiredException {
//      bool resultToken = await session.refreshToken(false);
//      if(resultToken)
//        return await call();
//      else
//        session.logout();
//    }
//    catch (e) {
//      showError(e.toString());
//    }
//    finally {
//      showProgress(false);
//    }
//  }

  void dispose() {
    _progressVisible.close();
    _error.close();
    _toast.close();
  }

}