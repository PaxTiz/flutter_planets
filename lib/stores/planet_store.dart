import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:planets/models/planet.dart';

class PlanetStore extends ChangeNotifier {

  List<Planet>? _planets;
  String _searchQuery = "";

  List<Planet>? get planets => _planets?.where(
    (p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase())
  ).toList();

  PlanetStore() {
    _loadAll();
    notifyListeners();
  }

  void _loadAll() async {
    final response = await http.get(Uri.http('localhost:5000', '/planets'));

    List<dynamic> planets = jsonDecode(response.body);
    _planets = planets.map((e) => Planet.fromJson(e)).toList();
  }

  void update(String search) {
    _searchQuery = search;
    notifyListeners();
  }

}