import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'form/custom_search_text_field.dart';

class Header extends StatelessWidget {
  final String title;
  final bool back;
  final bool profile;
  final ValueSetter<String>? onSearch;

  const Header({
    required this.title,
    this.back = false,
    this.profile = true,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kSpacing(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (back)
                  GestureDetector(
                    onTap: () => Constants.navigatorKey.currentState?.pop(),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      color: CustomColors.extraLightGray,
                    ),
                  ),
                if (back) SizedBox(width: kSpacing(4)),
                Text(title, style: Theme.of(context).textTheme.headline6),
              ],
            ),
            if (profile)
              GestureDetector(
                onTap: () =>
                    Constants.navigatorKey.currentState?.pushNamed('/profile'),
                child: CircleAvatar(
                  child: Text('VC'),
                ),
              ),
          ],
        ),
        SizedBox(height: kSpacing(3)),
        if (onSearch != null) CustomSearchTextField(search: onSearch!),
      ],
    );
  }
}
