import 'package:flutter/material.dart';

import '../../core/models/planet.dart';
import '../carousel.dart';
import 'planet_list_item.dart';

class RecommendedCarousel extends StatelessWidget {
  final List<Planet> celestBodies;

  const RecommendedCarousel(this.celestBodies);

  @override
  Widget build(BuildContext context) {
    if (celestBodies.isEmpty) {
      return Center(child: const Text('No data :('));
    }

    return Carousel(
      title: 'You may also like',
      items: celestBodies.map((e) => PlanetListItem(planet: e)).toList(),
      onClick: () {},
    );
  }
}
