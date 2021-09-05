import 'package:flutter/material.dart';
import 'package:planets/components/category_selector.dart';
import 'package:planets/components/header.dart';
import 'package:planets/components/planets/most_popular_carousel.dart';
import 'package:planets/stores/planet_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _items = ['Planets', 'Galaxies', 'Constellations'];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 32),
        Header(),
        SizedBox(height: 32),
        CategorySelector(
          items: _items,
          currentIndex: _currentIndex,
          onClick: (i) => setState(() => _currentIndex = i),
        ),
        SizedBox(height: 32),
        IndexedStack(
          index: _currentIndex,
          children: [
            ChangeNotifierProvider<PlanetStore>(
              create: (ctx) => PlanetStore(),
              builder: (ctx, _) => MostPopularCarousel(),
            ),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ],
    );
  }
}
