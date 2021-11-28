import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:planets/api/planets.dart';
import 'package:planets/models/planet.dart';

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