import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

class Header extends StatelessWidget {
  final String title;
  final bool search;
  final ValueSetter<String>? onSearch;

  const Header({
    required this.title,
    this.search = false,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kSpacing(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline6),
            CircleAvatar(
              child: Text('VC'),
            )
          ],
        ),
        SizedBox(height: kSpacing(3)),
        if (search)
          CupertinoSearchTextField(
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
            onChanged: onSearch,
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(kRadius),
            ),
          )
      ],
    );
  }
}
