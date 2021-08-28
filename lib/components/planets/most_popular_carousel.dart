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
          return Container(
            width: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 53, 59, 72),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    e.image,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(e.name)
              ],
            ),
          );
        }).toList(),
        onClick: () {},
      );
    }
  }
}
