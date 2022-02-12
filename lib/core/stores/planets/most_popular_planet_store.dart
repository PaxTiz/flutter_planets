import 'package:flutter/cupertino.dart';

import '../../../api/planets.dart';
import '../../models/planet.dart';

class MostPopularPlanetStore extends ChangeNotifier {
  List<Planet>? _planets;
  String _searchQuery = "";

  List<Planet>? get planets => _planets
      ?.where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

  MostPopularPlanetStore() {
    _loadAll();
  }

  void _loadAll() async {
    findAllPlanets(false)
        .then((planets) => _planets = planets)
        .catchError((_) => _planets = [])
        .whenComplete(() => notifyListeners());
  }

  void update(String search) {
    _searchQuery = search;
    notifyListeners();
  }
}
