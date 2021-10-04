import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:planets/models/planet.dart';

class RecommendedPlanetStore extends ChangeNotifier {

  List<Planet>? _planets;

  List<Planet>? get planets => _planets;

  RecommendedPlanetStore() {
    _loadAll();
  }

  void _loadAll() async {
    try {
      final response = await http.get(Uri.http('localhost:3000', '/planets/recommended'));

      List<dynamic> planets = jsonDecode(response.body);
      _planets = planets.map((e) => Planet.fromJson(e)).toList();
    } on SocketException {
      _planets = [];
    }

    notifyListeners();
  }

}