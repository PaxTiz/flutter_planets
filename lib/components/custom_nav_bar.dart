import 'package:flutter/material.dart';
import 'package:planets/app.dart';

class CustomNavBar extends StatelessWidget {

  final List<BarItem> items;
  final int currentIndex;
  final ValueSetter<int> onClick;

  CustomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 34, 47, 62),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((k) {
            final index = items.indexOf(k);
            return GestureDetector(
              onTap: () => onClick(index),
              child: Column(
                children: [
                  Icon(k.icon, color: currentIndex == index
                    ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                    : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  ),
                  SizedBox(height: 4),
                  Text(k.title, style: currentIndex == index
                    ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle
                    : Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

}