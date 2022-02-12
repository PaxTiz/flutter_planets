import 'dart:convert';

import '../api/api.dart';
import '../core/models/planet.dart';

Future<List<Planet>> findAllPlanets(bool galaxy) async {
  return request(HttpMethod.get, '/planets',
      queryParameters: {'galaxy': galaxy ? 'true' : 'false'}).then((response) {
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final planets = List.from(body['data']);
      return planets.map((e) => Planet.fromJson(e)).toList();
    }

    return <Planet>[];
  }).catchError((_) => <Planet>[]);
}
