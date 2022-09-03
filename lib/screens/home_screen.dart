import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/category_selector.dart';
import '../components/custom_loading_indicator.dart';
import '../components/header.dart';
import '../components/planets/most_popular_carousel.dart';
import '../components/planets/recommended_carousel.dart';
import '../config/constants.dart';
import '../core/stores/planet_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _items = ['Planets', 'Galaxies', 'Constellations'];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanetStore(),
      builder: (context, child) {
        final loading = context.watch<PlanetStore>().loading;

        if (loading) {
          return CustomLoadingIndicator(context);
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              title: 'Let\'s search',
              onSearch: (value) {},
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
