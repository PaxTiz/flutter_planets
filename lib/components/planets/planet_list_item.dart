import 'package:flutter/material.dart';
import 'package:planets/models/planet.dart';

enum PlanetListItemSize {
  big, small
}

class PlanetListItem extends StatelessWidget {
  final Planet planet;
  final PlanetListItemSize size; 
  const PlanetListItem({
    required this.planet,
    this.size = PlanetListItemSize.small
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/planet-details', arguments: planet);
      },
      child: Container(
        width: size == PlanetListItemSize.big ? 220 : 180,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                planet.image,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.name,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                  ),
                  Text(
                    planet.shortDescription,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
