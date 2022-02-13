import 'package:flutter/material.dart';
import 'package:planets/config/constants.dart';

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
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemBuilder: _buildCustomChip,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildCustomChip(BuildContext context, int i) {
    return GestureDetector(
      onTap: () => onClick(i),
      child: Container(
        margin: _margin(i),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: kSpacing(2)),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(kSpacing(3)),
        ),
        child: Center(
          child: Text(
            items[i].toUpperCase(),
            style: currentIndex == i ? _selectedChipTheme(context) : _unselectedChipTheme(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  EdgeInsets _margin(int i) {
    return EdgeInsets.only(
      left: i == 0 ? 0 : kSpacing(.5),
      right: i == items.length ? 0 : kSpacing(.5)
    );
  }

  TextStyle _unselectedChipTheme(BuildContext context) => Theme.of(context).textTheme.headline5!.copyWith(
    fontSize: 12,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );
  
  TextStyle _selectedChipTheme(BuildContext context) => _unselectedChipTheme(context).copyWith(
    color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor
  );

}