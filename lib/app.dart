import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/header.dart';
import 'components/planets/most_popular_carousel.dart';
import 'stores/planet_store.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ChangeNotifierProvider<PlanetStore>(
            create: (ctx) => PlanetStore(),
            child: Column(
              children: [
                Header(),
                SizedBox(height: 32),
                MostPopularCarousel()
              ],
            ),
          ),
        ),
      ),
    );
  }
}