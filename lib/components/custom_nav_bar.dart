import 'package:flutter/material.dart';

import '../app.dart';
import '../config/constants.dart';

class CustomNavBar extends StatelessWidget {
  final List<BarItem> items;
  final int currentIndex;
  final ValueSetter<int> onClick;

  CustomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kSpacing(2),
        horizontal: kSpacing(2.5),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(kSpacing(8)),
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
                  Icon(
                    k.icon,
                    color: currentIndex == index
                        ? Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedItemColor
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                  ),
                  SizedBox(height: kSpacing(.5)),
                  Text(
                    k.title,
                    style: currentIndex == index
                        ? Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedLabelStyle
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedLabelStyle,
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
