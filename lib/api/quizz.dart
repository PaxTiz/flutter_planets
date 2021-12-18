import 'dart:convert';
import '../api/api.dart';
import '../models/quizz.dart';

Future<List<QuizzCategory>> findAllQuizzCategories() async {
  return request(HttpMethod.get, '/quizz/categories').then((response) {
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final categories = List.from(body['data']);
      return categories.map((e) => QuizzCategory.fromJson(e)).toList();
    }

    return <QuizzCategory>[];
  }).catchError((_) => <QuizzCategory>[]);
}
