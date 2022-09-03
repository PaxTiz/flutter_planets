import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_loading_indicator.dart';
import '../components/header.dart';
import '../components/planets/most_popular_carousel.dart';
import '../components/planets/recommended_carousel.dart';
import '../config/constants.dart';
import '../core/stores/most_popular_celest_bodies_store.dart';
import '../core/stores/recommended_celest_bodies_store copy.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MostPopularCelestBodiesStore()),
        ChangeNotifierProvider(create: (_) => RecommendedCelestBodiesStore()),
      ],
      builder: (context, _) {
        final mostPopular =
            context.watch<MostPopularCelestBodiesStore>().celestBodies;
        final recommended =
            context.watch<RecommendedCelestBodiesStore>().celestBodies;

        if (mostPopular == null || recommended == null) {
          return CustomLoadingIndicator(context);
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(title: 'Let\'s search'),
            IndexedStack(
              index: _currentIndex,
              children: [
                Column(
                  children: [
                    MostPopularCarousel(mostPopular),
                    SizedBox(height: kSpacing(4)),
                    RecommendedCarousel(recommended)
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
