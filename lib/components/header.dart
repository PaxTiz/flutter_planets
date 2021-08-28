import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/stores/planet_store.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Let's explore", style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 8),
                Text('The milky way galaxy', style: Theme.of(context).textTheme.headline5),
              ],
            ),
            CircleAvatar(
              child: Text('VC'),
            )
          ],
        ),
        SizedBox(height: 32),
        CupertinoSearchTextField(
          backgroundColor: Color.fromARGB(255, 53, 59, 72),
          onChanged: (val) => context.read<PlanetStore>().update(val),
        )
      ]
    );
  }

}