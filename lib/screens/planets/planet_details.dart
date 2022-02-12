import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/planet.dart';

class PlanetDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final planet = ModalRoute.of(context)?.settings.arguments as Planet;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Icon(CupertinoIcons.ellipsis),
          SizedBox(width: 16),
        ],
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(CupertinoIcons.arrow_left, color: Colors.white)),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              planet.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                  Divider(color: Colors.white30),
                  SizedBox(height: 8),
                  Text(
                    planet.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(height: 1.6, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Divider(color: Colors.white30),
                  SizedBox(height: 8),
                  Text(
                    "Gallery",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
