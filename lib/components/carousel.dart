import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              SizedBox(width: 16),
              Icon(CupertinoIcons.arrow_right, color: Colors.white, size: 16),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 315,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.only(right: i == items.length ? 0 : 16),
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
