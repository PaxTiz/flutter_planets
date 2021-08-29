import 'package:flutter/material.dart';
import 'package:planets/components/header.dart';
import 'package:planets/components/planets/most_popular_carousel.dart';
import 'package:planets/stores/planet_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlanetStore>(
      create: (ctx) => PlanetStore(),
      child: Column(
        children: [
          Header(),
          SizedBox(height: 32),
          MostPopularCarousel(),
        ],
      ),
    );
  }
}