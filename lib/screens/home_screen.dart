import 'package:flutter/material.dart';
import 'package:planets/components/header.dart';
import 'package:planets/components/planets/most_popular_carousel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SizedBox(height: 32),
        MostPopularCarousel(),
      ],
    );
  }
}