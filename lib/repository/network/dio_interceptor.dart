import 'dart:async';

import 'package:dio/dio.dart';
import 'package:golf/repository/network/http_client_interface.dart';
import 'package:golf/repository/network/model/server_response.dart';

class DioInterceptor extends DioBaseInterceptor {

  final HttpDataClientInterface httpDataClientInterface;

  DioInterceptor(this.httpDataClientInterface);

  String _getBearer() => "Bearer ${httpDataClientInterface.session.token}";

  @override
  Future onRequest(RequestOptions options) async {
    super.onRequest(options);

    if( options.headers.containsKey("Authorization") && options.headers["Authorization"] != _getBearer() )
      options.headers["Authorization"] = _getBearer();

    options.headers.putIfAbsent("Authorization", () => _getBearer());

  }

  @override
  Future onError(DioError error) async {

    if (error.response?.statusCode == 401) {

      RequestOptions options = error.response.request;

      // If the token has been updated, repeat directly.
      if (_getBearer() != options.headers["Authorization"]) {
        options.headers["Authorization"] = _getBearer();
        //repeat
        return httpDataClientInterface.dio.request(options.path, options: options);
      }
      // update token and repeat
      // Lock to block the incoming request until the token updated
      httpDataClientInterface.dio.lock();
      httpDataClientInterface.dio.interceptors.responseLock.lock();
      httpDataClientInterface.dio.interceptors.errorLock.lock();

      return httpDataClientInterface.session.refreshSessionToken().then((success) {

        httpDataClientInterface.dio.unlock();
        httpDataClientInterface.dio.interceptors.responseLock.unlock();
        httpDataClientInterface.dio.interceptors.errorLock.unlock();

        //If there is form data recreate form data or the request will fail.
        if (options.data is FormData) {
          FormData formData = FormData();
          formData.fields.addAll(options.data.fields);

          if((options.data as FormData).files.isNotEmpty)
            return super.onError(DioError(error: "Token refreshed please retry!"));

          options.data = formData;
        }

        return httpDataClientInterface.dio.request(options.path, options: options);

      }).catchError((err){

        httpDataClientInterface.dio.clear();

        httpDataClientInterface.dio.unlock();
        httpDataClientInterface.dio.interceptors.responseLock.unlock();
        httpDataClientInterface.dio.interceptors.errorLock.unlock();

        httpDataClientInterface.session.logout();

        return;
      });

    }

    return super.onError(error);
  }

  @override
  Future onResponse(Response response) async {
    return super.onResponse(response);
  }
}

class DioBaseInterceptor extends InterceptorsWrapper {

  DioBaseInterceptor();

  @override
  Future onRequest(RequestOptions options) async {
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    return ServerResponse(error: true, errorCode: err.type.index, errorText: err.message, result: {});
  }

  @override
  Future onResponse(Response response) async {
    try {
      return ServerResponse.fromJson(response.data);
    } catch (err) {
      return response;
    }
  }
}
