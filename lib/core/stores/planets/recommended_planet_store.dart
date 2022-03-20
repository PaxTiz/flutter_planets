import '../../http.dart';
import '../../models/planet.dart';
import '../base_store.dart';

class RecommendedPlanetStore extends BaseStore {
  List<Planet>? _planets;

  List<Planet>? get planets => _planets;

  RecommendedPlanetStore() : super(null) {
    _loadAll();
  }

  void _loadAll() async {
    await http.get('/planets').then((response) {
      final data = List.from(response.data as List);
      _planets = data
          .map((e) => e as Map<String, dynamic>)
          .map((e) => Planet.fromJson(e))
          .toList();
    }).catchError((e) {
      _planets = [];
    }).whenComplete(() => notifyListeners());
  }
}
