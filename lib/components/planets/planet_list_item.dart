import 'package:flutter/material.dart';
import 'package:planets/models/planet.dart';

class PlanetListItem extends StatelessWidget {

  final Planet planet;
  const PlanetListItem({required this.planet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/planet-details', arguments: planet);
      },
      child: Container(
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
                planet.image,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(planet.name)
          ],
        ),
      ),
    );
  }

}