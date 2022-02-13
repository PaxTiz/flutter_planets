import 'dart:convert';

import '../api/api.dart';
import '../core/models/planet.dart';

Future<List<Planet>> findAllPlanets(bool galaxy) async {
  return request(HttpMethod.get, '/planets',
      queryParameters: {'galaxy': galaxy ? 'true' : 'false'}).then((response) {
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final planets = List.from(body['data'] as List);
      return planets
          .map((e) => Planet.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return <Planet>[];
  }).catchError((_) => <Planet>[]);
}
