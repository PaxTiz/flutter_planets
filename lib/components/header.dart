import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../stores/planets/most_popular_planet_store.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kSpacing(4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Let's explore", style: Theme.of(context).textTheme.headline6),
            CircleAvatar(
              child: Text('VC'),
            )
          ],
        ),
        SizedBox(height: kSpacing(3)),
        CupertinoSearchTextField(
          itemColor: CustomColors.light_gray,
          placeholderStyle: TextStyle(color: CustomColors.light_gray),
          style: TextStyle(
            color: CustomColors.light_gray, 
            fontFamily: 'Montserrat',
            fontSize: 16
          ),
          prefixInsets: EdgeInsets.symmetric(vertical: kSpacing(1), horizontal: kSpacing(2)),
          itemSize: kSpacing(2),
          onChanged: (val) => context.read<MostPopularPlanetStore>().update(val),
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(kSpacing(3))
          ),
        )
      ]
    );
  }

}