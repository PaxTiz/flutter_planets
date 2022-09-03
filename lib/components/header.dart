import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'form/custom_search_text_field.dart';

class Header extends StatelessWidget {
  final String title;
  final ValueSetter<String>? onSearch;

  const Header({
    required this.title,
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
        if (onSearch != null) CustomSearchTextField(search: onSearch!),
      ],
    );
  }
}
