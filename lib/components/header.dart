import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/stores/planets/most_popular_planet_store.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
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
          itemColor: Color.fromARGB(255, 113, 128, 147),
          placeholderStyle: TextStyle(color: Color.fromARGB(255, 113, 128, 147)),
          style: TextStyle(color: Color.fromARGB(255, 113, 128, 147), fontSize: 15),
          prefixInsets: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          itemSize: 15,
          onChanged: (val) => context.read<MostPopularPlanetStore>().update(val),
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(32)
          ),
        )
      ]
    );
  }

}