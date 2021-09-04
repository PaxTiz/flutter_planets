import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/models/planet.dart';

class PlanetDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final planet = ModalRoute.of(context)?.settings.arguments as Planet;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(CupertinoIcons.arrow_left, color: Colors.white),
                ),
                Icon(CupertinoIcons.ellipsis, color: Colors.white),
              ],
            ),
            SizedBox(height: 16),
            Image.network(
              planet.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
                planet.name,
              style: Theme.of(context).textTheme.headline6,
            ),

            SizedBox(height: 8),
            Divider(color: Colors.white30),
            SizedBox(height: 8),

            Text(
              planet.description,
              style: Theme.of(context).textTheme.headline5?.copyWith(height: 1.6),
            ),

            SizedBox(height: 8),
            Divider(color: Colors.white30),
            SizedBox(height: 8),

            Text(
              "Gallery",
              style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
            ),
            SizedBox(height: 8),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}