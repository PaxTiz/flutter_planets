import 'package:http/http.dart' as http;

import '../config/constants.dart';

enum HttpMethod { get, post, patch, put, delete }

Future<http.Response> request(
  HttpMethod method,
  String url, {
  Map<String, dynamic>? queryParameters,
}) {
  final uri = Uri.http(Constants.apiUrl, url, queryParameters);
  switch (method) {
    case HttpMethod.get:
      return http.get(uri);
    case HttpMethod.post:
      return http.post(uri);
    case HttpMethod.patch:
      return http.patch(uri);
    case HttpMethod.put:
      return http.put(uri);
    case HttpMethod.delete:
      return http.delete(uri);
  }
}
