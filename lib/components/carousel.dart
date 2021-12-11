import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/constants.dart';

class Carousel extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final VoidCallback onClick;

  const Carousel({
    required this.title,
    required this.items,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onClick,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: titleStyle(context)),
              SizedBox(width: kSpacing(2)),
              Icon(
                CupertinoIcons.arrow_right, 
                color:  Theme.of(context).textTheme.headline5!.color,
                size: kSpacing(2),
              ),
            ],
          ),
        ),
        SizedBox(height: kSpacing(2)),
        SizedBox(
          height: 285,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.only(right: i == items.length ? 0 : kSpacing(2)),
              child: items[i],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle titleStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .headline5!
      .copyWith(fontWeight: FontWeight.bold, fontSize: 14);
}
