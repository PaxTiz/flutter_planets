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

    return Flexible(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          childAspectRatio: 3,
        ),
        itemCount: items.length,
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => onClick(i),
          child: Container(
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
        ),
      ),
    );
  }

}