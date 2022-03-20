import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../core/models/planet.dart';

enum PlanetListItemSize { big, small }

class PlanetListItem extends StatelessWidget {
  final Planet planet;
  final PlanetListItemSize size;
  const PlanetListItem({
    required this.planet,
    this.size = PlanetListItemSize.small,
  });

  @override
  Widget build(BuildContext context) {
    final width = size == PlanetListItemSize.big ? 240 : 200;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/planet-details', arguments: planet);
      },
      child: Container(
        width: width.toDouble(),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: planet.image,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planet.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                      ),
                      SizedBox(height: kSpacing(1)),
                      Text(
                        planet.shortDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
