import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/stores/planet_store.dart';
import '../carousel.dart';
import 'planet_list_item.dart';

class MostPopularCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<PlanetStore>();

    if (store.mostPopularPlanets.isEmpty) {
      return Center(child: const Text('No data :('));
    }

    final planets = store.mostPopularPlanets;
    return Carousel(
      title: 'Most Popular',
      items: planets.map((e) => PlanetListItem(planet: e)).toList(),
      onClick: () {},
    );
  }
}
