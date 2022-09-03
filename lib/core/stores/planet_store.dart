import '../http.dart';
import '../models/planet.dart';
import 'base_store.dart';

class PlanetStore extends BaseStore {
  List<Planet> mostPopularPlanets = [];
  List<Planet> recommendedPlanets = [];

  bool loading = true;

  final Map<String, String> errors = {};

  PlanetStore() : super(null) {
    _findMostPopularAndRecommended();
  }

  void _findMostPopularAndRecommended() async {
    await Future.wait([
      http.get('/planets').then((response) {
        final data = List.from(response.data as List);
        mostPopularPlanets = data
            .map((e) => e as Map<String, dynamic>)
            .map((e) => Planet.fromJson(e))
            .toList();
      }).catchError((e) {
        mostPopularPlanets = [];
      }),
      http.get('/planets').then((response) {
        final data = List.from(response.data as List);
        recommendedPlanets = data
            .map((e) => e as Map<String, dynamic>)
            .map((e) => Planet.fromJson(e))
            .toList();
      }).catchError((e) {
        recommendedPlanets = [];
      })
    ]).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }
}
