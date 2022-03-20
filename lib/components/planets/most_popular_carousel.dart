import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/stores/planets/most_popular_planet_store.dart';
import '../carousel.dart';
import 'planet_list_item.dart';

class MostPopularCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<MostPopularPlanetStore>();

    if (store.planets == null) {
      return Center(child: const CircularProgressIndicator.adaptive());
    } else if (store.planets!.isEmpty) {
      return Center(child: const Text('No data :('));
    } else {
      final planets = store.planets!;
      return Carousel(
        title: 'Most Popular',
        items: planets
            .map((e) => PlanetListItem(
                  planet: e,
                  size: PlanetListItemSize.big,
                ))
            .toList(),
        onClick: () {},
      );
    }
  }
}
