import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

class CustomSearchTextField extends StatelessWidget {
  final ValueSetter<String> search;

  const CustomSearchTextField({
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      itemColor: CustomColors.lightGray,
      placeholderStyle: TextStyle(color: CustomColors.lightGray),
      style: TextStyle(
        color: CustomColors.lightGray,
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
      prefixInsets: EdgeInsets.symmetric(
        vertical: kSpacing(1),
        horizontal: kSpacing(2),
      ),
      itemSize: kSpacing(2),
      onChanged: search,
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(kRadius),
      ),
    );
  }
}
