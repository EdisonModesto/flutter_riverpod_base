import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../commons/providers/common_providers.dart';
import '../../res/strings.dart';
import '../../utils/config.dart';
import '../core.dart';

/// Watch apiProvider to make sure to have the latest authToken passed.

final apiProvider = StateProvider((ref) {
  final authToken = ref.watch(authTokenProvider);
  return API(authToken: authToken);
});

/// Contains common methods required for client side APIs [GET, POST, PUT, DELETE].
/// Pass the [url] from endpoints using [Endpoints] class.
/// Every method has an optional parameter [requireAuth] default [true].
/// Set [requireAuth] to [false] if [authToken] is Empty.
class API {
  final String? _authToken;

  API({required String? authToken}) : _authToken = authToken;

  final Dio _dio = Dio();

  FutureEither<Response> getRequest({
    required String url,
    bool requireAuth = true,
  }) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authToken",
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpGet);
      log('requireAuth : $requireAuth', name: LogLabel.httpGet);
    }
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: requestHeaders),
      );
      log('RESPONSE : ${response.data}', name: LogLabel.httpGet);
      return Right(response);
    } catch (e, stktrc) {
      return Left(
        Failure(message: FailureMessage.getRequestMessage, stackTrace: stktrc),
      );
    }
  }

  FutureEither<Response> postRequest({
    required String url,
    dynamic body,
    bool requireAuth = true,
  }) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authToken",
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPost);
      log('requireAuth : $requireAuth', name: LogLabel.httpPost);
      log('BODY : $body', name: LogLabel.httpPost);
    }
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      log('RESPONSE : ${response.data}', name: LogLabel.httpPost);
      return Right(response);
    } catch (e, stktrc) {
      return Left(
        Failure(message: FailureMessage.postRequestMessage, stackTrace: stktrc),
      );
    }
  }

  FutureEither<Response> putRequest({
    required String url,
    dynamic body,
    bool requireAuth = true,
  }) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authToken",
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPut);
      log('requireAuth : $requireAuth', name: LogLabel.httpPut);
      log('BODY : $body', name: LogLabel.httpPut);
    }
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      log('RESPONSE : ${response.data}', name: LogLabel.httpPut);
      return Right(response);
    } catch (e, stktrc) {
      return Left(
        Failure(message: FailureMessage.putRequestMessage, stackTrace: stktrc),
      );
    }
  }

  FutureEither<Response> deleteRequest({
    required String url,
    dynamic body,
    bool requireAuth = true,
  }) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authToken",
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpDelete);
      log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
      log('BODY : $body', name: LogLabel.httpDelete);
    }
    try {
      final response = await _dio.delete(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      log('RESPONSE : ${response.data}', name: LogLabel.httpDelete);
      return Right(response);
    } catch (e, stktrc) {
      return Left(
        Failure(
          message: FailureMessage.deleteRequestMessage,
          stackTrace: stktrc,
        ),
      );
    }
  }
}
