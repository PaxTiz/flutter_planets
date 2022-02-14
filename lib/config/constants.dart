import 'package:flutter/cupertino.dart';

abstract class Constants {
  static final appTitle = 'Planets';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static const apiUrl = 'http://localhost:8080';
}

abstract class CustomColors {
  static final extraLightGray = Color.fromARGB(255, 199, 232, 255);

  static final lightGray = Color.fromARGB(255, 113, 128, 147);
  static final lightBlue = Color.fromARGB(255, 72, 219, 251);

  static final darkBlue = Color.fromARGB(255, 34, 47, 62);
  static final extraDarkBlue = Color.fromARGB(75, 25, 42, 86);

  static final buttonColor = CupertinoColors.systemIndigo;
}

double kSpacing(double count) => 8 * count;
