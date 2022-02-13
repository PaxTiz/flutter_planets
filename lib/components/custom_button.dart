import 'package:flutter/material.dart';

import '../config/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final EdgeInsets padding;
  final bool full;

  const CustomButton({
    required this.text,
    required this.onClick,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
    this.full = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: full ? MediaQuery.of(context).size.width : null,
        height: (padding.top + padding.bottom) * 1.5,
        padding: padding,
        decoration: BoxDecoration(
          color: CustomColors.buttonColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    );
  }
}
