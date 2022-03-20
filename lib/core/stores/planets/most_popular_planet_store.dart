import '../../http.dart';
import '../../models/planet.dart';
import '../base_store.dart';

class MostPopularPlanetStore extends BaseStore {
  List<Planet>? _planets;
  String _searchQuery = "";
  final Map<String, String> _errors = {};
  Map<String, String> get errors => _errors;

  List<Planet>? get planets => _planets
      ?.where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

  MostPopularPlanetStore() : super(null) {
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

  void update(String search) {
    _searchQuery = search;
    notifyListeners();
  }
}
