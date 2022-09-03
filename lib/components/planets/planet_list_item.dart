import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../core/models/planet.dart';

enum PlanetListItemSize { big, small }

class PlanetListItem extends StatelessWidget {
  final Planet planet;

  const PlanetListItem({
    required this.planet,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth =
        min(MediaQuery.of(context).size.width * .8, 240).toDouble();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/planet-details', arguments: planet);
      },
      child: Container(
        width: maxWidth,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              child: CachedNetworkImage(
                imageUrl: planet.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                planet.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
