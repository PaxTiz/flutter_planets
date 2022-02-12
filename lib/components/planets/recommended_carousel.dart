import 'package:flutter/material.dart';
import 'package:planets/components/planets/planet_list_item.dart';
import 'package:provider/provider.dart';

import '../../core/stores/planets/recommended_planet_store.dart';
import '../carousel.dart';

class RecommendedCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<RecommendedPlanetStore>();

    if (store.planets == null) {
      return Center(child: const CircularProgressIndicator.adaptive());
    } else if (store.planets!.isEmpty) {
      return Center(child: const Text('No data :('));
    } else {
      final planets = store.planets!;
      return Carousel(
        title: 'You may also like',
        items: planets.map((e) => PlanetListItem(planet: e)).toList(),
        onClick: () {},
      );
    }
  }
}
