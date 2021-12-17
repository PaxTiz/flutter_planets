import 'package:flutter/cupertino.dart';
import '../../api/planets.dart';
import '../../models/planet.dart';

class RecommendedPlanetStore extends ChangeNotifier {

  List<Planet>? _planets;

  List<Planet>? get planets => _planets;

  RecommendedPlanetStore() {
    _loadAll();
  }

  void _loadAll() async {
    findAllPlanets(false)
      .then((planets) => _planets = planets)
      .catchError((_) => _planets = [])
      .whenComplete(() => notifyListeners());
  }

}