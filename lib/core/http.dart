import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../config/constants.dart';
import 'auth_manager.dart';

Dio get http {
  final dio = Dio(BaseOptions(baseUrl: Constants.apiUrl));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      if (options.headers[HttpHeaders.contentTypeHeader] ==
          'application/json') {
        options.data = jsonEncode(options.data);
      }

      final token = AuthManager.shared.token;
      if (token != null) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }

      return handler.next(options);
    },
    onResponse: (e, handler) {
      if ([400, 401, 422, 500].contains(e.statusCode)) {
        final requestOptions = RequestOptions(
          path: e.realUri.toString(),
          data: jsonDecode(e.data as String),
        );
        final error = DioError(requestOptions: requestOptions);
        return handler.reject(error);
      }

      return handler.next(e);
    },
  ));

  return dio;
}
