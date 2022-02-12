import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../constants.dart';

Dio get http {
  final dio = Dio(BaseOptions(baseUrl: Constants.apiUrl));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      if (options.headers[HttpHeaders.contentTypeHeader] ==
          'application/json') {
        options.data = jsonEncode(options.data);
      }

      return handler.next(options);
    },
    onResponse: (e, handler) {
      if ([400, 401, 422, 500].contains(e.statusCode)) {
        final requestOptions = RequestOptions(
          path: e.realUri.toString(),
          data: jsonDecode(e.data),
        );
        final error = DioError(requestOptions: requestOptions);
        return handler.reject(error);
      }

      return handler.next(e);
    },
  ));

  return dio;
}
