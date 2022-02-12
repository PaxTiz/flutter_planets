import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/category_selector.dart';
import '../components/header.dart';
import '../components/planets/most_popular_carousel.dart';
import '../components/planets/recommended_carousel.dart';
import '../constants.dart';
import '../core/stores/planets/most_popular_planet_store.dart';
import '../core/stores/planets/recommended_planet_store.dart';

class HomeScreen extends StatefulWidget {
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _items = ['Planets', 'Galaxies', 'Constellations'];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MostPopularPlanetStore()),
        ChangeNotifierProvider(create: (ctx) => RecommendedPlanetStore()),
      ],
      builder: (ctx, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              title: 'Let\'s search',
              search: true,
              onSearch: (value) =>
                  ctx.read<MostPopularPlanetStore>().update(value),
            ),
            SizedBox(height: kSpacing(4)),
            CategorySelector(
              items: _items,
              currentIndex: _currentIndex,
              onClick: (i) => setState(() => _currentIndex = i),
            ),
            SizedBox(height: kSpacing(4)),
            IndexedStack(
              index: _currentIndex,
              children: [
                Column(
                  children: [
                    MostPopularCarousel(),
                    SizedBox(height: kSpacing(4)),
                    RecommendedCarousel()
                  ],
                ),
                Placeholder(),
                Placeholder(),
              ],
            ),
          ],
        );
      },
    );
  }
}
