import 'dart:convert';

import '../api/api.dart';
import '../core/models/quizz.dart';

Future<List<QuizzCategory>> findAllQuizzCategories() async {
  return request(HttpMethod.get, '/quizz/categories').then((response) {
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final categories = List.from(body['data'] as List);
      return categories
          .map((e) => QuizzCategory.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return <QuizzCategory>[];
  }).catchError((_) => <QuizzCategory>[]);
}
