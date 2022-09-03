import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

class CustomTextField extends StatelessWidget {
  final ValueSetter<String> input;

  const CustomTextField({
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholderStyle: TextStyle(color: CustomColors.lightGray),
      style: TextStyle(
        color: CustomColors.lightGray,
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
      onChanged: input,
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(kRadius),
      ),
    );
  }
}
