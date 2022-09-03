import '../http.dart';
import '../models/planet.dart';
import 'base_store.dart';

class RecommendedCelestBodiesStore extends BaseStore {
  List<Planet>? celestBodies;

  RecommendedCelestBodiesStore() : super(null) {
    _findRecommended();
  }

  void _findRecommended() async {
    await http.get('/planets').then((response) {
      final data = List.from(response.data as List);
      celestBodies = data
          .map((e) => e as Map<String, dynamic>)
          .map((e) => Planet.fromJson(e))
          .toList();
    }).catchError((e) {
      celestBodies = [];
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
