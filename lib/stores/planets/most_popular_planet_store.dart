import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:planets/models/planet.dart';

class MostPopularPlanetStore extends ChangeNotifier {

  List<Planet>? _planets;
  String _searchQuery = "";

  List<Planet>? get planets => _planets?.where(
    (p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase())
  ).toList();

  MostPopularPlanetStore() {
    _loadAll();
  }

  void _loadAll() async {
    try {
      final response = await http.get(Uri.http('localhost:3000', '/planets/popular'));

      List<dynamic> planets = jsonDecode(response.body);
      _planets = planets.map((e) => Planet.fromJson(e)).toList();
    } on SocketException {
      _planets = [];
    }

    notifyListeners();
  }

  void update(String search) {
    _searchQuery = search;
    notifyListeners();
  }

}