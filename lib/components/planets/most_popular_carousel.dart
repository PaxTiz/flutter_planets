import 'package:planets/components/planets/planet_list_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:planets/stores/planet_store.dart';

import '../carousel.dart';

class MostPopularCarousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PlanetStore>();

    if (store.planets == null) {
      return Center(child: CircularProgressIndicator.adaptive());
    } else if (store.planets!.isEmpty) {
      return Center(child: Text('No data :('));
    } else {
      final planets = store.planets!;
      return Carousel(
        title: 'Most Popular',
        items: planets.map((e) {
          return PlanetListItem(planet: e);
        }).toList(),
        onClick: () {},
      );
    }
  }
}
