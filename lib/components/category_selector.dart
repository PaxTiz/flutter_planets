import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {

  final List<String> items;
  final int currentIndex;
  final ValueSetter<int> onClick;

  CategorySelector({
    required this.items,
    required this.currentIndex,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    final unselectedChipTheme = Theme.of(context).textTheme.headline5!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
    final selectedChipTheme = unselectedChipTheme.copyWith(
        color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(items.length, (i) => GestureDetector(
          onTap: () => onClick(i),
          child: Container(
            margin: EdgeInsets.only(
              left: i == 0 ? 0 : 4,
              right: i == items.length ? 0 : 4
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Center(
              child: Text(
                items[i].toUpperCase(),
                style: currentIndex == i ? selectedChipTheme : unselectedChipTheme,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )),
      ),
    );
  }

}